class Entity
{
  float x;
  float y;
  PImage img;
  String type;
  int imgH;
  int imgW;
  PolygonShape sd;
  Body body;

  Entity(float _x, float _y, PImage _img)
  {
    x=_x;
    y=_y;
    img=_img;
  }
  private void CreateBody(BodyType bType, float density, float friction, float restitution)
  {
    imgH = img.height;
    imgW = img.width;
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(imgW/2);
    float box2dH = box2d.scalarPixelsToWorld(imgH/2);
    sd.setAsBox(box2dW, box2dH);
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    fd.density = density;
    fd.friction = friction;
    fd.restitution = restitution;
    BodyDef bd = new BodyDef();
    bd.type = bType;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    body = box2d.createBody(bd);
    body.createFixture(fd);
  }
  public void Draw()
  {
    //body.setTransform(body.getPosition(), rot);
    PVector pos = box2d.getBodyPixelCoordPVector(body);
    float a = body.getAngle();
    body.getFixtureList();
    imageMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    image(img, 0, 0);
    popMatrix();
  }
}