package;

import flixel.group.FlxGroup;

class Feet extends FlxGroup
{
  var leftFoot:Foot;
  var rightFoot:Foot;

  var distanceFromCenter = 80;

  var onScreenOnce:Bool ;

  var px:Float =0;
  var py:Float=0;
  var angle:Float = 70;

  public function new()
  {
    super();
    resetFeet();
  }

  private function pickStartPos():Void
  {
    //THREE MAIN PARAMETERS:
    //XPos, YPos, and the angle
    var side:Int = Std.int(Math.random() * 4);
    switch(side)
    {
      case 0:
        //LEFT SIDE
        px = -120;
        py = Math.random() * Reg.tilemap.height;
        angle = Math.random() * 140 - 70;   
      case 1:
        //TOP SIDE
        px = Math.random() * Reg.tilemap.width;
        py = -120;
        angle = Math.random() * 140 + 110;
      case 2:
        //RIGHT SIDE
        px = Reg.tilemap.width + 120;
        py = Math.random() * Reg.tilemap.height;
        angle = Math.random() * 140 + 200;
      case 3:
        //BOTTOM SIDE
        px = Reg.tilemap.width * Math.random();
        py = Reg.tilemap.height + 120;
        angle = Math.random() * 140 + 290;
    }
  }

  public function resetFeet():Void
  {
    pickStartPos();

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

    leftFoot.angle = angle;
    rightFoot.angle = angle;

    leftFoot.stage = .5;
    rightFoot.stage = 1.5;

    rightFoot.loadGraphic("assets/images/footprint.png");
    leftFoot.loadGraphic("assets/images/footprint-right.png");

    add(leftFoot);
    add(rightFoot); 
    alive = true;
    onScreenOnce = false;
  }


  override public function update():Void
  {
    super.update();
    if(alive)
    {
      if(leftFoot.inWorldBounds() || rightFoot.inWorldBounds())
      {
        onScreenOnce = true;
      }
      else
      {
        if(onScreenOnce)
        {
          //remove(leftFoot);
          //remove(rightFoot);
          alive = false;
        }
      }
    }
  }
}
