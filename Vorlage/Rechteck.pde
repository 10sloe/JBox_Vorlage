class Rechteck extends Figur{
  
  //Attribute
  float w;
  float h;
 
  // Konstruktor
  Rechteck(float x, float y, float w_, float h_, float vx, float vy) {
    w = w_;
    h = h_;
    // Add the box to the box2d world
    makeBody(new Vec2(x, y), w, h, vx, vy);
    c = color(177);
  }

  // Attribute
  void display() {
   
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Rotationswinkel
    float a = body.getAngle();

    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(c);
    stroke(0);
    rect(0, 0, w, h);
    popMatrix();
  }


  void makeBody(Vec2 center, float w_, float h_, float vx, float vy) {

    // Define a polygon (this is what we use for a rectangle)
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW, box2dH);

    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    // Define the body and make it from the shape
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));

    body = box2d.createBody(bd);
    body.createFixture(fd);

    // Give it some initial random velocity
    body.setLinearVelocity(new Vec2(vx,-vy));
  }
}
