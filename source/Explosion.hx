package;

import flixel.effects.particles.FlxEmitter;
import flixel.effects.particles.FlxParticle;

class Explosion extends FlxEmitter
{
  public function new(x:Float = 0, y:Float = 0)
  {
    super(x,y,30);
    var particle:FlxParticle;
    var i:Int =0;
    while(i<maxSize/2)
    {
      particle = new FlxParticle();
      particle.makeGraphic(2,2,0xDDDD0000);
      particle.visible = false;
      add(particle);
      particle = new FlxParticle();
      particle.makeGraphic(1,1,0xDDDD0000);
      particle.visible = false;
      add(particle);
      i++;
    }
    start(true, 3, .01);
  }
}

