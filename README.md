# Friday Night Funkin': Pan Engine

## What the funk is Pan Engine??

Pan Engine is a brand new Engine joining the FNF Community! The Developtment started in January and made its **FIRST** release in June.

## Missing Features

 - Options Menu
 - Ghost Tap
 - Working Chart Editor

## How to build Pan Engine??

OH! You need compiling help?? Alrighty:

First, you need to install Haxe and HaxeFlixel. 
1. [Install Haxe 4.1.5](https://haxe.org/download/version/4.1.5/)
2. [Install HaxeFlixel](https://haxeflixel.com/documentation/install-haxeflixel/) after downloading Haxe

Run those commands:
```
haxelib install flixel 4.10.0
haxelib install flixel-addons 2.11.0
haxelib install flixel-ui 2.4.0
haxelib install hscript 2.4.0
```

You'll also need to install a couple things that involve Gits. To do this, you need to do a few things first.
1. Download [git-scm](https://git-scm.com/downloads). Works for Windows, Mac, and Linux, just select your build.
2. Follow instructions to install the application properly.
3. Run `haxelib git polymod https://github.com/larsiusprime/polymod.git` to install Polymod.
4. Run `haxelib git discord_rpc https://github.com/Aidan63/linc_discord-rpc` to install Discord RPC.

You should have everything ready for compiling the game! Follow the guide below to continue!

At the moment, you can optionally fix the transition bug in songs with zoomed-out cameras.
- Run `haxelib git flixel-addons https://github.com/HaxeFlixel/flixel-addons` in the terminal/command-prompt.