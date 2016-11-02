class Border extends Entity
{
  Border(float _x, float _y, PImage _img)
  {
    super(_x, _y, _img);
    super.CreateBody(BodyType.STATIC, 50, 5, 0);
    super.body.setUserData(this);
  }
}