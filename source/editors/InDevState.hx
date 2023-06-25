package editors;

import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.text.FlxBitmapText;
import flixel.FlxSprite;
import flixel.FlxG;

class InDevState extends MusicBeatState
{
    var bg:FlxSprite;
    var bfUhm:FlxSprite;
    var textShit:FlxText;

    var uhoh:Alphabet;

    override function create()
    {
        bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
        bg.color = 0xFF242424;
        bg.setGraphicSize(Std.int(bg.width * 1.2));
		bg.updateHitbox();
        bg.screenCenter();
		add(bg);

        bfUhm = new FlxSprite(920, 350).loadGraphic(Paths.image('editors/uhmmBF'));
        add(bfUhm);

        var uhoh:Alphabet = new Alphabet(0, 50, "Uh Oh", true, false);
        uhoh.screenCenter(X);
        uhoh.isMenuItem = false;
        add(uhoh);

        textShit = new FlxText(0, FlxG.height / 2 - 16, FlxG.width, "Seems like you've wanted to use this editor,", 32);
        textShit.screenCenter(X);
        textShit.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
        textShit.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 4);
        add(textShit);

        textShit = new FlxText(0, FlxG.height / 2 + 16, FlxG.width, "", 32);
        textShit.screenCenter(X);
        textShit.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
        textShit.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 4);
        textShit.applyMarkup("but it *isn't coded in yet*. Come back in future updates!",
            [
                new FlxTextFormatMarkerPair(new FlxTextFormat(0xFFFF0000), "*")
            ]);
        add(textShit);

        var goBack = new FlxText(0, FlxG.height / 2 + 128, FlxG.width, "Press BACK to exit.", 32);
        goBack.screenCenter(X);
        goBack.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
        goBack.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 4);
        add(goBack);

        super.create();
    }

    override function update(elapsed:Float)
    {
        if (controls.BACK)
        {
            FlxG.sound.play(Paths.sound('cancelMenu'));
            FlxG.switchState(new editors.MasterEditorState());
        }

        super.update(elapsed);
    }
}