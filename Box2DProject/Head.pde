class Head extends Entity
{
  PVector velocity = new PVector(random(-10, 10), 0);
  Head(float _x, float _y, PImage _img)
  {
    super(_x, _y, _img);
    super.CreateBody(BodyType.DYNAMIC, random(0,2), 0, 5);
    super.body.setUserData(this);
    //body.setGravityScale(0);
  }
  public void update()
  {
    PVector pos = box2d.getBodyPixelCoordPVector(body);
    Vec2 currentVelocity = super.body.getLinearVelocity();
    if (!outwards)
    {
      velocity.x=width/2-pos.x;
      velocity.y=pos.y-height/2;
      currentVelocity.x = velocity.x;
      currentVelocity.y = velocity.y;
    }
    super.body.setLinearVelocity(currentVelocity);
  }
}