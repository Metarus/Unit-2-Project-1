class Head extends Entity
{
  PVector velocity = new PVector(random(-10, 10), 0);
  Head(float _x, float _y, PImage _img)
  {
    super(_x, _y, _img);
    super.CreateBody(BodyType.DYNAMIC, 1, 0, 0);
    super.body.setUserData(this);
  }
  public void update()
  {
    PVector pos = box2d.getBodyPixelCoordPVector(body);
    Vec2 currentVelocity = super.body.getLinearVelocity();
    if (mousePressed)
    {
      velocity.x=mouseX-pos.x;
      velocity.y=pos.y-mouseY;
      currentVelocity.x = velocity.x;
      currentVelocity.y = velocity.y;
    }
    super.body.setLinearVelocity(currentVelocity);
  }
}