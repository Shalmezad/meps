package;
import flixel.FlxSprite;

class Foot extends FlxSprite
{
  var speed:Float = 40; 
  var direction:Float = -.01; 
  var stage:Float = 1;
  public function new()
  {
    super();
    loadGraphic("assets/images/footprint.png");
  }
  override public function update():Void
  {
    super.update();

    stage += direction;
    this.scale.x = Math.min(stage, 1);
    this.scale.y = Math.min(stage, 1);
    this.alpha = this.scale.x;

    if(stage <= .5)
    {
      direction = .01;
    }
    else if(stage > 2)
    {
      direction = -.01;
    }

    var moving:Bool = stage < 1;
 

    if(moving)
    {
      move();
    }
    else
    {
      velocity.x = 0;
      velocity.y = 0;
    }

  }



  private function move()
  {
    var xSpeed = Math.cos(angle * Math.PI / 180) * speed;
    var ySpeed = Math.sin(angle * Math.PI / 180) * speed;
    velocity.x = xSpeed;
    velocity.y = ySpeed;
  }
}
