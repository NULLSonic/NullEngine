package options;

import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxSprite;

class MainOptionsState extends MusicBeatState
{
    var bg:FlxSprite;

    private var grpOptions:FlxTypedGroup<Alphabet>;
    var curSelected:Int = 0;

    var options:Array<String> = ['Controls', 'Preference', 'Gameplay'];
    
    override function create()
    {
        bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
        bg.color = 0xffff55b8;
        bg.setGraphicSize(Std.int(bg.width * 1.2));
		bg.updateHitbox();
        bg.screenCenter();
		add(bg);

        grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

        for (i in 0...options.length)
            {
                var optionsText:Alphabet = new Alphabet(0, (70 * i) + 30, options[i], true, false);
                optionsText.isMenuItem = true;
                optionsText.targetY = i;
                grpOptions.add(optionsText);
            }

        super.create();
    }

    override function update(elapsed:Float)
        {
            if(controls.BACK)
            {
                FlxG.sound.play(Paths.sound('cancelMenu'));
                FlxG.switchState(new MainMenuState());
            }

            if (controls.ACCEPT)
            {
                FlxG.sound.play(Paths.sound('confirmMenu'));
                if (curSelected == 0) {

                }
                if (curSelected == 1) {
                        
                }
                if (curSelected == 2) {
                    FlxG.switchState(new options.GameplayState());
                }
            }
    
            super.update(elapsed);
    
            var upP = controls.UI_UP_P;
            var downP = controls.UI_DOWN_P;
    
            if (upP)
                changeSelection(-1);
            if (downP)
                changeSelection(1);
        }
    
        var bullShit:Int = 0;
    
    function changeSelection(change:Int = 0)
    {
        FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
        
        curSelected += change;
        
        if (curSelected < 0)
            curSelected = options.length - 1;
        if (curSelected >= options.length)
            curSelected = 0;
        
        var bullShit:Int = 0;
       
        for (item in grpOptions.members)
        {
            item.targetY = bullShit - curSelected;
            bullShit++;
        
            item.alpha = 0.6;
                
        
            if (item.targetY == 0)
            {
                item.alpha = 1;

            }
        }
    }
}