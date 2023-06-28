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
    var bfUhm:FlxSprite;
    var textShit:FlxText;
    var hasSeen:Bool = false;

    override function create()
    {
        FlxG.mouse.visible = false;

        bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
        bg.color = 0xFF242424;
        bg.setGraphicSize(Std.int(bg.width * 1.2));
		bg.updateHitbox();
        bg.screenCenter();
		add(bg);

        bfUhm = new FlxSprite(920, 350).loadGraphic(Paths.image('editors/uhmmBF'));
        add(bfUhm);

        textShit = new FlxText(0, FlxG.height / 2 - 150, FlxG.width, "", 32);
        textShit.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
           textShit.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 4);
        textShit.applyMarkup("*Watch out!!*\n\n\n\n\n\nThis game contains *flashing lights* and *disturbing* stuff.\n\n\n\n\n\n\n\n\n\nPress *ENTER* to exit!",
        [
            new FlxTextFormatMarkerPair(new FlxTextFormat(0xFFFF0000), "*")
        ]);
        add(textShit);

        super.create();
    }

    override function update(elapsed:Float)
    {
        if (FlxG.keys.justPressed.BACKSPACE) {
            FlxG.switchState(new TitleState());
            //hasSeen = true;
            //FlxG.save.data.hasSeen = hasSeen;
        }
        if (FlxG.keys.justPressed.ENTER) {
            FlxG.switchState(new TitleState());
        }

        super.update(elapsed);
    }
}