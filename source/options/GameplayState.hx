package options;

import flixel.FlxSprite;
import Controls;

class GameplayState extends MusicBeatState
{
    var bg:FlxSprite;
	var downScroll:Bool = false;
    var downScrollText:Alphabet;

    override function create()
    {
        bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
        bg.color = 0xffff55b8;
        bg.setGraphicSize(Std.int(bg.width * 1.2));
		bg.updateHitbox();
        bg.screenCenter();
		add(bg);

        var downScrollText:Alphabet = new Alphabet(0, 70, "Downscroll", true, false);
        downScrollText.isMenuItem = true;
        add(downScrollText);

        super.create();
    }

    override function update(elapsed:Float)
    {

        if (controls.ACCEPT)
        {
            if (downScroll = true)
            {
                downScroll = false;
                //trace("Changed Option: " + downScroll);
            }
            else
            {
                downScroll == true;
                //trace("Changed Option: " + downScroll);

            }

            trace(downScroll);
        }

        super.update(elapsed);
    }
}