class Figur
{
  // Attribute
  Body body;
  color c;

  // Methoden
  void setColor(int r, int g, int b)
  {
    c = color(r, g, b);
  }

  void display()
  {
  }

  void killBody() {
    box2d.destroyBody(body);
  }
}
