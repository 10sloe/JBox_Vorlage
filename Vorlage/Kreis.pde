class Kreis extends Figur 
{
  //Attribute
  float radius;

  // Konstruktor
  Kreis(float x, float y, float r_, float vx, float vy) {
    radius = r_;
    // Fügt den Körper zur Welt hinzu
    makeBody(new Vec2(x, y), 2*radius, 2*radius, vx, vy);
    c = color(220);
  }

  // Attribute
  void display() {
   
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Rotationswinkel
    float a = body.getAngle();
    
    ellipseMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(c);
    stroke(0);
    ellipse(0, 0, radius*2, radius*2);
    popMatrix();
  }

  void makeBody(Vec2 center, float w_, float h_, float vx, float vy) {

    CircleShape cs = new CircleShape();
    float radius = w_/2;
    cs.m_radius = box2d.scalarPixelsToWorld(radius);
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 2;
    fd.friction = 0.1;
    fd.restitution = 0.3;



    // Define the body and make it from the shape
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));

    body = box2d.createBody(bd);
    body.createFixture(fd);

    // Give it some initial random velocity
    body.setLinearVelocity(new Vec2(vx, -vy));
  }
}
