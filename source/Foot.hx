package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.system.FlxSound;

class Foot extends FlxSprite
{
  var speed:Float = 60; 
  var direction:Float = -.01; 
  public var stage:Float = 1;

  public var FOOT_UP_STAGE = .5;
  public var FOOT_DOWN_STAGE = 1;

  private var _sndStomp:FlxSound;
  private var playedStomp:Bool = false;

  public function new()
  {
    super();
    loadGraphic("assets/images/footprint.png");
    immovable = true;
    _sndStomp = FlxG.sound.load(AssetPaths.stomp__wav);
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

    if(Math.abs(stage-FOOT_DOWN_STAGE) < direction && direction > 0 && !playedStomp)
    {
      //assets/aounds/stomp.wav      
      if(Math.abs(this.x - Reg.player.x) < 100 && Math.abs(this.y - Reg.player.y) < 100)
      {
        //trace("boom");
        _sndStomp.play();
        playedStomp = true;
      }
    }
 
    if(direction < 0)
    {
      playedStomp = false;
    }

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
