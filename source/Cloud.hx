package;

import flixel.FlxSprite;

class Cloud extends FlxSprite
{
  public function new()
  {
    super();
    loadGraphic("assets/images/cloud.png");
    resetCloud();
  }

  public function resetCloud():Void
  {
    this.x = Main.gameWidth;
    this.y = Main.gameHeight * Math.random();
    this.velocity.x = Math.random() * -40 -20;
  }
  
  override public function update():Void
  {
    super.update();
    if(this.x + this.width < 0)
    {
      this.kill();
    }
  }
}
