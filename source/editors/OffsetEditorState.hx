package editors;

import flixel.text.FlxText;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.addons.ui.FlxInputText;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class OffsetEditorState extends MusicBeatState
{
    var BG:FlxSprite;
    var character:FlxSprite;

    var charText:FlxText;
    var charName:FlxInputText;

    override function create()
    {
        FlxG.mouse.visible = true;

        BG = new FlxSprite(0, 0).loadGraphic(Paths.image('menuDesat'));
        BG.screenCenter();
        BG.color = 0xFF242424;
        add(BG);

        charText = new FlxText(10, 30, FlxG.width, "Character Name", 24);
        charText.setFormat("VCR OSD Mono", 24, FlxColor.WHITE, LEFT);
        charText.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 2);
        add(charText);

        charName = new FlxInputText(10, charText.y + 30, 300, "DADDY_DEAREST", 16, FlxColor.BLACK, FlxColor.WHITE);
        add(charName);

        character = new FlxSprite(0, 0); 
        character.frames = Paths.getSparrowAtlas('characters/DADDY_DEAREST');
        character.animation.addByPrefix('idle', 'Dad idle dance', 24, true);
        character.animation.play('idle');
        character.screenCenter();
        trace('characters/' + charName.text);
        add(character);


        super.create();
    }
}