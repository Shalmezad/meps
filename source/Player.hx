package;

import flixel.FlxSprite;
import flixel.FlxG;

class Player extends FlxSprite
{

  var SPEED:Int = 30;

  public function new()
  {
    super();
    makeGraphic(10,10,0xFFFFFF00);
  }

  override public function update():Void
  {
    super.update();

    velocity.x = 0;
    velocity.y = 0;

    if(FlxG.keys.pressed.W)
    {
      velocity.y -= SPEED; 
    }
    if(FlxG.keys.pressed.S)
    {
      velocity.y += SPEED;
    }
    if(FlxG.keys.pressed.A)
    {
      velocity.x -= SPEED;
    }
    if(FlxG.keys.pressed.D)
    {
      velocity.x += SPEED;
    }
  }
}
