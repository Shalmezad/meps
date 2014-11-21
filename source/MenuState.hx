package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class MenuState extends FlxState
{

  var cloudTimer:Int = 0;

  var clouds:FlxTypedGroup<Cloud>;

	override public function create():Void
	{
		super.create();

    bgColor = 0x6b6b6b;

    clouds = new FlxTypedGroup();
    add(clouds);
    //var cloud:Cloud = new Cloud();
    //add(cloud);

    var buffer:Int = 40;
    var titleText = new FlxText(buffer,20,Main.gameWidth - buffer * 2, "MONSTERS of EPIC PROPORTIONS");

    titleText.color = 0xFF382d40;

    titleText.alignment = "center";
    add(titleText);

    var startButton = new FlxButton(0, 0, "START", startGame);
    startButton.x = Main.gameWidth/2 - startButton.width/2;
    startButton.y = Main.gameHeight - startButton.height - 10;
    add(startButton);
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
    cloudTimer--;
    if(cloudTimer <= 0)
    {
      cloudTimer = 60;
      var cloud:Cloud = clouds.recycle(Cloud);
      cloud.resetCloud();
    }
	}	

  private function startGame():Void
  {
    FlxG.switchState(new GameState());
  }
}
