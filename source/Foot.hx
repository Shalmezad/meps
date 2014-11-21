package;
import flixel.FlxSprite;
import flixel.FlxObject;

class Foot extends FlxSprite
{
  var speed:Float = 40; 
  var direction:Float = -.01; 
  public var stage:Float = 1;

  public var FOOT_UP_STAGE = .5;
  public var FOOT_DOWN_STAGE = 1;

  public function new()
  {
    super();
    loadGraphic("assets/images/footprint.png");
    immovable = true;
  }
  override public function update():Void
  {
    super.update();

    stage += direction;
    this.scale.x = Math.min(stage, 1);
    this.scale.y = Math.min(stage, 1);
    this.alpha = this.scale.x;

    if(stage <= FOOT_UP_STAGE)
    {
      direction = .01;
    }
    else if(stage >= FOOT_DOWN_STAGE + FOOT_UP_STAGE)
    {
      direction = -.01;
    }

    var moving:Bool = stage < 1;
 

    if(moving)
    {
      allowCollisions = FlxObject.NONE;
      move();
    }
    else
    {
      allowCollisions = FlxObject.ANY;
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
