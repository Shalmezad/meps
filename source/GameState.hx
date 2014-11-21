package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.tile.FlxTilemap;
import openfl.Assets;

class GameState extends FlxState
{
  var player:Player;
  var tilemap:FlxTilemap;
	override public function create():Void
	{
		super.create();
    player = new Player();

    tilemap = new FlxTilemap();
    var mapText:String = Assets.getText("assets/data/map.csv");
    trace(mapText);
    tilemap.loadMap(mapText, "assets/images/tilemap.png", 40, 40, 0, 0, 1, 2);

    add(tilemap);
    add(player);
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
	}	
}
