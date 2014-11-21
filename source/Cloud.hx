package;

import flixel.FlxSprite;

class Cloud extends FlxSprite
{
  public function new()
  {
    super();
    this.x = Main.gameWidth;
    this.y = Main.gameHeight * Math.random();
    this.velocity.x = Math.random() * -40 -20;
    loadGraphic("assets/images/cloud.png");
  }
}
