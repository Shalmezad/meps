package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxPoint;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.tile.FlxTilemap;
import openfl.Assets;

class GameState extends FlxState
{
  var player:Player;
  var tilemap:FlxTilemap;
  var feet:Feet;
	override public function create():Void
	{
		super.create();
    player = new Player();

    //load the tilemap
    tilemap = new FlxTilemap();
    var mapText:String = Assets.getText("assets/data/map.csv");
    tilemap.loadMap(mapText, "assets/images/tilemap.png", 40, 40, 0, 0, 1, 5);

    //Load a foot:
    feet = new Feet();

    //Need to put the player on a legal tile:
    var legalTiles:Array<FlxPoint> = tilemap.getTileCoords(3, true);
    player.x = legalTiles[0].x;
    player.y = legalTiles[0].y;
    

    add(tilemap);
    add(player);
    add(feet);

    FlxG.camera.follow(player);

    FlxG.worldBounds.set(0,0,tilemap.width, tilemap.height);


	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
    FlxG.collide(player, tilemap);
	}	
}
