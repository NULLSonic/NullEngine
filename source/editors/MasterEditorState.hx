package editors;

import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxG;
import flixel.FlxSprite;

class MasterEditorState extends MusicBeatState
{
    private var grpEditors:FlxTypedGroup<Alphabet>;

    var curSelected:Int = 0;

    var bg:FlxSprite;
    var moddingText:Alphabet;

    var editors:Array<String> = [
        'Chart Editor',
        'Character Editor',
        'Stage Editor'
    ];

    override function create()
    {
        bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
        bg.color = 0xFF242424;
        bg.setGraphicSize(Std.int(bg.width * 1.2));
		bg.updateHitbox();
        bg.screenCenter();
		add(bg);

        grpEditors = new FlxTypedGroup<Alphabet>();
		add(grpEditors);

        for (i in 0...editors.length)
            {
                var editorsText:Alphabet = new Alphabet(0, (70 * i) + 30, editors[i], true, false);
                editorsText.isMenuItem = true;
                editorsText.targetY = i;
                grpEditors.add(editorsText);
            }

        var versionShit:FlxText = new FlxText(5, FlxG.height - 18, 0, "Master Editor Ver: 0.0.1", 12);
        versionShit.screenCenter(X);
        versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        add(versionShit);

        var moddingText:Alphabet = new Alphabet(0, 25, "Modding State", true, false);
        moddingText.screenCenter(X);
        moddingText.isMenuItem = false;
        add(moddingText);

        super.create();
    }

    override function update(elapsed:Float)
    {
        if(controls.BACK)
        {
            FlxG.sound.play(Paths.sound('cancelMenu'));
            FlxG.switchState(new MainMenuState());
        }

        super.update(elapsed);

        var upP = controls.UI_UP_P;
		var downP = controls.UI_DOWN_P;
		var accepted = controls.ACCEPT;

		if (upP)
			changeSelection(-1);
		if (downP)
			changeSelection(1);
		if (accepted)
            if(curSelected == 0) {
                FlxG.sound.play(Paths.sound('confirmMenu'));
                FlxG.switchState(new editors.ChartingState());
            }
            else
            {
                FlxG.sound.play(Paths.sound('confirmMenu'));
                FlxG.switchState(new editors.InDevState());
            }
    }

    var bullShit:Int = 0;

    function changeSelection(change:Int = 0)
        {
            NGio.logEvent('Fresh');
    
            // NGio.logEvent('Fresh');
            FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
    
            curSelected += change;
    
            if (curSelected < 0)
                curSelected = editors.length - 1;
            if (curSelected >= editors.length)
                curSelected = 0;
    
            // selector.y = (70 * curSelected) + 30;
    
            var bullShit:Int = 0;
   
            for (item in grpEditors.members)
            {
                item.targetY = bullShit - curSelected;
                bullShit++;
    
                item.alpha = 0.6;
                // item.setGraphicSize(Std.int(item.width * 0.8));
    
                if (item.targetY == 0)
                {
                    item.alpha = 1;
                    // item.setGraphicSize(Std.int(item.width));
                }
            }
        }
}