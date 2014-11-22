package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.util.FlxPoint;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.tile.FlxTile;
import flixel.tile.FlxTilemap;
import openfl.Assets;

class GameState extends FlxState
{
  var SPAWN_DELAY:Int = 180;


  var player:Player;
  var tilemap:FlxTilemap;

  //var feet:Feet;
  var monsters:FlxGroup;

  var deadCount:Int = 0;
  var spawnTick:Int = 0;

  var key:FlxSprite;

  var hasKey:Bool = false;

	override public function create():Void
	{
		super.create();
    player = new Player();

    //load the tilemap
    tilemap = new FlxTilemap();
    var mapText:String = Assets.getText("assets/data/map.csv");
    tilemap.loadMap(mapText, "assets/images/tilemap.png", 40, 40, 0, 0, 1, 5);
    Reg.tilemap = tilemap;

    key = new FlxSprite();
    key.loadGraphic("assets/images/key.png");

    key.x = Math.random() * tilemap.width/2;
    key.y = Math.random() * tilemap.height/2;

    //Load a foot:
    //feet = new Feet();
    monsters = new FlxGroup();

    //Need to put the player on a legal tile:
    var legalTiles:Array<FlxPoint> = tilemap.getTileCoords(3, true);
    player.x = legalTiles[0].x;
    player.y = legalTiles[0].y;
    
    add(tilemap);
    add(player);
    add(key);
    //add(feet);
    add(monsters);

    FlxG.camera.follow(player);
    FlxG.camera.bounds = tilemap.getBounds();
    FlxG.worldBounds.set(0,0,tilemap.width, tilemap.height);
    //FlxG.sound.playMusic("assets/music/gameplay_by_artic_spaceman.mp3", 1, true);
	#if flash
    FlxG.sound.playMusic(AssetPaths.gameplay_by_artic_spaceman__mp3, 1, true);
	#else
    FlxG.sound.playMusic(AssetPaths.gameplay_by_artic_spaceman__ogg, 1, true);
	#end
    
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
    FlxG.collide(player, tilemap);
    /*
    var i:Int =0;
    while(i<2)
    {
      tilemap.overlapsWithCallback(cast(feet.members[i], FlxObject), footStompTile);
      i++;
    }
    */

    tilemap.overlapsWithCallback(cast(player, FlxObject), playerOpenGate);
    //FlxG.collide(player,feet );
    //FlxG.overlap(player,feet, footStompPlayer);
    FlxG.collide(player, monsters);
    FlxG.overlap(player, monsters, footStompPlayer);
    
    if(!player.alive)
    {
      deadCount++;
      if(deadCount > 300)
      {
        FlxG.switchState(new MenuState());
      }
    }

    if(FlxG.overlap(player, key))
    {
      hasKey = true;
      key.scrollFactor.x = 0;
      key.scrollFactor.y = 0;
      key.x = 5;
      key.y = 5;
    }

    spawnTick--;
    if(spawnTick <= 0)
    {
      spawnFoot();
      spawnTick = SPAWN_DELAY;
    } 

	}	

  private function spawnFoot()
  {
    monsters.add(new Feet());
  }

  private function footStompPlayer(p:FlxObject, f:FlxObject):Void
  {
    var foot:Foot = cast(f, Foot);
    if(foot.stage >= foot.FOOT_DOWN_STAGE)
    {
      trace("SQUISH!");
      killPlayer();
    }
  }


  private function killPlayer():Void
  {
    if(player.alive)
    {
      player.kill();
      add(new Explosion(player.x, player.y));
    }
  }

  private function footStompTile(t:FlxObject, object2:FlxObject):Bool
  {
    var tile:FlxTile = cast(t, FlxTile);
    var foot:Foot = cast(object2, Foot);
    
    if(foot.stage >= foot.FOOT_DOWN_STAGE && tile.index == 5)
    {
      var xPos:Int = Std.int(tile.x / 40);
      var yPos:Int = Std.int(tile.y / 40);

      tilemap.setTile(xPos, yPos, 4, true);
    }
    return false;
  }

  private function playerOpenGate(t:FlxObject, object2:FlxObject):Bool
  {
    var tile:FlxTile = cast(t, FlxTile);
    if(tile.index == 7 && hasKey)
    {
      var xPos:Int = Std.int(tile.x / 40);
      var yPos:Int = Std.int(tile.y / 40);

      tilemap.setTile(xPos, yPos, 3, true);
    }
    return false;
  }

}
