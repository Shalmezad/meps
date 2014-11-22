package;

import flixel.FlxSprite;
import flixel.FlxG;

class Player extends FlxSprite
{

  var SPEED:Int = 30;

  public function new()
  {
    super();
    Reg.player = this;
    //makeGraphic(10,10,0xFFFFFF00);
    loadGraphic("assets/images/player.png");
  }

  override public function update():Void
  {
    super.update();

    velocity.x = 0;
    velocity.y = 0;

    if(FlxG.keys.pressed.W)
    {
      velocity.y -= SPEED; 
      this.angle = 0;
    }
    if(FlxG.keys.pressed.S)
    {
      velocity.y += SPEED;
      this.angle = 180;
    }
    if(FlxG.keys.pressed.A)
    {
      velocity.x -= SPEED;
      this.angle = 270;
    }
    if(FlxG.keys.pressed.D)
    {
      velocity.x += SPEED;
      this.angle = 90;
    }
  }
}
