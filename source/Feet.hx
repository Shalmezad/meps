package;

import flixel.group.FlxGroup;

class Feet extends FlxGroup
{
  var leftFoot:Foot;
  var rightFoot:Foot;

  var distanceFromCenter = 80;

  var onScreenOnce:Bool = false;

  public function new()
  {
    super();

    var angle:Float = 45;
    var px:Int = 0;
    var py:Int = 0;

    var leftAngle = angle - 90;
    var rightAngle = angle + 90;

    var leftDiffX = Math.cos(leftAngle) * distanceFromCenter;
    var leftDiffY = Math.sin(leftAngle) * distanceFromCenter;

    var rightDiffX = Math.cos(rightAngle) * distanceFromCenter;
    var rightDiffY = Math.sin(rightAngle) * distanceFromCenter;

    leftFoot = new Foot();
    rightFoot = new Foot();

    leftFoot.x = leftDiffX + px;
    leftFoot.y = leftDiffY + py;

    rightFoot.x = rightDiffX + px;
    rightFoot.y = rightDiffY + px;

    leftFoot.angle = 45;
    rightFoot.angle = 45;

    leftFoot.stage = .5;
    rightFoot.stage = 1.5;

    add(leftFoot);
    add(rightFoot); 
  }


  override public function update():Void
  {
    super.update();
    if(leftFoot.inWorldBounds() || rightFoot.inWorldBounds())
    {
      onScreenOnce = true;
    }
    else
    {
      if(onScreenOnce)
      {
        //trace("Kill feet");
      }
    }
  }
}
