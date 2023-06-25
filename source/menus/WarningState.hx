package menus;

import flixel.addons.transition.FlxTransitionableState;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxState;

class WarningState extends MusicBeatState
{
    var bg:FlxSprite;
    var textShit:FlxText;

    override function create()
    {
        FlxG.mouse.visible = false;

        bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
        bg.color = 0xFF242424;
        bg.setGraphicSize(Std.int(bg.width * 1.2));
		bg.updateHitbox();
        bg.screenCenter();
		add(bg);

        textShit = new FlxText(0, FlxG.height / 2 - 150, FlxG.width, "", 32);
        textShit.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
        textShit.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 4);
        textShit.applyMarkup("*Watch out!!*\n\nThis game contains *flashing lights* and *disturbing* stuff.\nYou can *turn off* the flashing lights in the options menu.\n\n\n\n\n\n\n\nPress *ENTER* to exit!",
        [
            new FlxTextFormatMarkerPair(new FlxTextFormat(0xFFFF0000), "*")
        ]);
        add(textShit);

        FlxG.sound.play(Paths.music('breakfast'), 1, true); //Can somebody help me?? I can't get it to work.

        super.create();
    }

    override function update(elapsed:Float)
    {
        if (FlxG.keys.justPressed.ENTER) {
            FlxG.switchState(new TitleState());
        }

        super.update(elapsed);
    }
}