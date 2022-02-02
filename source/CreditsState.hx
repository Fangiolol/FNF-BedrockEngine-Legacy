package;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
#if MODS_ALLOWED
import sys.FileSystem;
import sys.io.File;
#end
import lime.utils.Assets;

using StringTools;

class CreditsState extends MusicBeatState
{
	public var curSelected:Int = -1;

	public var warningDialogue:FunkinConfirm;

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var iconArray:Array<AttachedSprite> = [];

	public var creditsStuff:Array<Array<String>> = [];

	var bg:FlxSprite;
	var descBox:FlxSprite;
	var descText:FlxText;
	var intendedColor:Int;
	var colorTween:FlxTween;

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Reading the Credits", null);
		#end

		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		add(bg);
		bg.screenCenter();
		
		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		#if MODS_ALLOWED
		// trace("finding mod shit");
		for (folder in Paths.getModDirectories())
		{
			var creditsFile:String = Paths.mods(folder + '/data/credits.txt');
			if (FileSystem.exists(creditsFile))
			{
				var firstarray:Array<String> = File.getContent(creditsFile).split('\n');
				for (i in firstarray)
				{
					var arr:Array<String> = i.replace('\\n', '\n').split("::");
					if (arr.length >= 5)
						arr.push(folder);
					creditsStuff.push(arr);
				}
				creditsStuff.push(['']);
			}
		};
		var folder = "";
		var creditsFile:String = Paths.mods('data/credits.txt');
		if (FileSystem.exists(creditsFile))
		{
			var firstarray:Array<String> = File.getContent(creditsFile).split('\n');
			for (i in firstarray)
			{
				var arr:Array<String> = i.replace('\\n', '\n').split("::");
				if (arr.length >= 5)
					arr.push(folder);
				creditsStuff.push(arr);
			}
			creditsStuff.push(['']);
		}
		#end
		// mano desculpa de eu des ordenei as coisas, é do tabnine
		var pisspoop:Array<Array<String>> = [
			// Name - Icon name - Description - Link - BG Color
			['Bedrock Engine Team'],
			[
				'Gui iago',
				'gui',
				'Engine Coder and Publisher',
				'https://github.com/Gui-iago',
				'26B65B'
			],
			[
				'Luisinh010',
				'luis',
				'Engine Coder',
				'https://github.com/Luisinhi010',
				'DBAC50'
			],
			[
				'Stilic',
				'stilic',
				'Menu Animations, Freeplay Bump, Max Optimization, Complex Accuracy Lua to Source.',
				'https://github.com/ShadowMario/FNF-PsychEngine/pull/1809',
				'FF873C'
			],
			[
				'ShadowBowser',
				'shadowbowser',
				'Artist, Old Credits Screen Icons',
				'https://www.reddit.com/u/JulioHaHaHa',
				'444444'
			],
			[''],
			['Bedrock Contributors'],
			[
				'NxtVithor',
				'nxtvithor',
				'Note Skins',
				'https://twitter.com/NxtVithor',
				'FF00E4'
			],
			[
				'Suok',
				'suok',
				'Title Screen Logo, Credits Icons',
				'https://twitter.com/oSuOk3',
				'ff0062'
			],
			[
				'Gazozoz',
				'gazozoz',
				'Camera Movement Code',
				'https://twitter.com/Gazozoz_',
				'ff0062'
			],
			[
				'Prynnho',
				'prynn',
				'Rich Presence Designer',
				'https://twitter.com/PrynnShilvaru',
				'4253A2'
			],
			[
				'Dex Dousky',
				'dex',
				'Main Menu Music, Game Over Music',
				'https://twitter.com/cachorro_sonico',
				'58320D'
			],
			[
				'LazyBudd',
				'lazyb',
				'Offset Song',
				'https://twitter.com/Lazy_Weeddy_boy',
				'FF6200'
			],
			[''],
			['Original PRs'],
			[
				'BURGER76920',
				'burger',
				'Json-editable Menus',
				'https://github.com/ShadowMario/FNF-PsychEngine/pull/3891',
				'D78B50'
			],
			[
				'CerBor',
				'cerbor',
				'Difficulty Drop Down on Chart Menu',
				'https://github.com/ShadowMario/FNF-PsychEngine/pull/2896',
				'C952E0'
			],
			[
				'HiroMizuki',
				'hirom',
				'Pixel Note Splashes',
				'https://github.com/ShadowMario/FNF-PsychEngine/pull/1792',
				'31FF7C'
			],
			[
				'i-winxd',
				'i-winxd',
				'Complex Accuracy (Old Lua)',
				'https://github.com/ShadowMario/FNF-PsychEngine/discussions/2917',
				'FFA6D2'
			],
			[
				'lemz1',
				'lemz1',
				'Play as Opponent',
				'https://github.com/ShadowMario/FNF-PsychEngine/pull/2770',
				'48C7FF'
			],
			[
				'l1ttleO',
				'l1ttleO',
				'Hit Sounds, Miss Sounds Toggle',
				'https://github.com/l1ttleO/ProjectFNF',
				'a3fbfb'
			],
			[
				'magnumsrtisswag',
				'magnums',
				'Credits Warning',
				'https://github.com/magnumsrtisswag',
				'333333'
			],
			[
				'Starmapo',
				'starmapo',
				'Time Signatures on Chart Editor',
				'https://github.com/ShadowMario/FNF-PsychEngine/pull/3428',
				'83FF87'
			],
			[
				'XtraXD1',
				'xtraxd1',
				'Show/Hide Weeks temporally + Getting/Setting on Source Code',
				'https://github.com/ShadowMario/FNF-PsychEngine/pull/3192',
				'91CBFF'
			],
			[''],
			['Engine Shoutouts'],
			[
				'shubs',
				'shubs',
				'Made Forever Engine, Main Inspiration',
				'https://github.com/Yoshubs/Forever-Engine-Legacy',
				'4494E6'
			],
			[
				'Verwex',
				'verwex',
				'Made Mic´d Up Engine, Winning Icons, Original Code for Menu Animations',
				'https://github.com/Verwex/Funkin-Mic-d-Up-SC',
				'F3B56B'
			],
			[''],
			['Psych Engine Team'],
			[
				'Shadow Mario',
				'shadowmario',
				'Main Programmer of Psych Engine',
				'https://twitter.com/Shadow_Mario_',
				'444444'
			],
			[
				'RiverOaken',
				'riveroaken',
				'Main Artist/Animator of Psych Engine',
				'https://twitter.com/river_oaken',
				'C30085'
			],
			[
				'bb-panzu',
				'bb-panzu',
				'Additional Programmer of Psych Engine',
				'https://twitter.com/bbsub3',
				'389A58'
			],
			[''],
			['Engine Contributors'],
			[
				'shubs',
				'shubs',
				'New Input System Programmer',
				'https://twitter.com/yoshubs',
				'4494E6'
			],
			[
				'SqirraRNG',
				'gedehari',
				'Chart Editor\'s Sound Waveform base',
				'https://twitter.com/gedehari',
				'FF9300'
			],
			[
				'iFlicky',
				'iflicky',
				'Delay/Combo Menu Song Composer\nand Dialogue Sounds',
				'https://twitter.com/flicky_i',
				'C549DB'
			],
			[
				'PolybiusProxy',
				'polybiusproxy',
				'.MP4 Video Loader Extension',
				'https://twitter.com/polybiusproxy',
				'FFEAA6'
			],
			[
				'Keoiki',
				'keoiki',
				'Note Splash Animations',
				'https://twitter.com/Keoiki_',
				'FFFFFF'
			],
			[
				'Smokey',
				'smokey',
				'Spritemap Texture Support',
				'https://twitter.com/Smokey_5_',
				'0033CC'
			],
			[''],
			["Funkin' Crew"],
			[
				'ninjamuffin99',
				'ninjamuffin99',
				"Programmer of Friday Night Funkin'",
				'https://twitter.com/ninja_muffin99',
				'F73838'
			],
			[
				'PhantomArcade',
				'phantomarcade',
				"Animator of Friday Night Funkin'",
				'https://twitter.com/PhantomArcade3K',
				'FFBB1B'
			],
			[
				'evilsk8r',
				'evilsk8r',
				"Artist of Friday Night Funkin'",
				'https://twitter.com/evilsk8r',
				'53E52C'
			],
			[
				'kawaisprite',
				'kawaisprite',
				"Composer of Friday Night Funkin'",
				'https://twitter.com/kawaisprite',
				'6475F3'
			]
		];

		for (i in pisspoop)
		{
			creditsStuff.push(i);
		}

		for (i in 0...creditsStuff.length)
		{
			var isSelectable:Bool = !unselectableCheck(i);
			var optionText:Alphabet = new Alphabet(0, 70 * i, creditsStuff[i][0], !isSelectable, false);
			optionText.isMenuItem = true;
			optionText.screenCenter(X);
			optionText.yAdd -= 70;
			if (isSelectable)
			{
				optionText.x -= 70;
			}
			optionText.forceX = optionText.x;
			// optionText.yMult = 90;
			optionText.targetY = i;
			grpOptions.add(optionText);

			if (isSelectable)
			{
				if (creditsStuff[i][5] != null)
				{
					Paths.currentModDirectory = creditsStuff[i][5];
				}

				var icon:AttachedSprite = new AttachedSprite('credits/' + creditsStuff[i][1]);
				icon.xAdd = optionText.width + 10;
				icon.sprTracker = optionText;

				// using a FlxGroup is too much fuss!
				iconArray.push(icon);
				add(icon);
				Paths.currentModDirectory = '';

				if (curSelected == -1)
					curSelected = i;
			}
		}

		descBox = new FlxSprite().makeGraphic(1, 1, FlxColor.BLACK);
		descBox.alpha = 0.6;
		add(descBox);

		descText = new FlxText(50, 600, 1180, "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		descText.scrollFactor.set();
		descText.borderSize = 2.4;
		add(descText);

		warningDialogue = new FunkinConfirm(null, "WARNING!!!", null, (action: FunkinConfirmAction) -> {
			warningDialogue.hide();
			if (action == FunkinConfirmAction.YES_BUTTON_PRESSED) {
				CoolUtil.browserLoad(creditsStuff[curSelected][3]);
			}
		});
		add(warningDialogue);

		bg.color = getCurrentBGColor();
		intendedColor = bg.color;
		changeSelection();
		super.create();
	}

	override function update(elapsed:Float)
	{
		warningDialogue.setText("YOU ARE ABOUT TO GO TO: \n"
		+ creditsStuff[curSelected][3] + "\nARE YOU ABSOLUTELY SURE YOU WANT TO GO TO THIS URL? \n(Y - Yes, N - No, C - Close this window)");

		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		var upP = controls.UI_UP_P;
		var downP = controls.UI_DOWN_P;

		if (upP)
		{
			changeSelection(-1);
		}
		if (downP)
		{
			changeSelection(1);
		}

		if (controls.BACK)
		{
			if (colorTween != null)
			{
				colorTween.cancel();
			}
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}
		if (FlxG.keys.pressed.ENTER)
		{
			warningDialogue.show();
		}
		super.update(elapsed);
	}

	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		do
		{
			curSelected += change;
			if (curSelected < 0)
				curSelected = creditsStuff.length - 1;
			if (curSelected >= creditsStuff.length)
				curSelected = 0;
		}
		while (unselectableCheck(curSelected));

		var newColor:Int = getCurrentBGColor();
		warningDialogue.setColor(FlxColor.fromInt(newColor));
		if (newColor != intendedColor)
		{
			if (colorTween != null)
			{
				colorTween.cancel();
			}
			intendedColor = newColor;
			colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
				onComplete: function(twn:FlxTween)
				{
					colorTween = null;
				}
			});
		}

		var bullShit:Int = 0;

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			if (!unselectableCheck(bullShit - 1))
			{
				item.alpha = 0.6;
				if (item.targetY == 0)
				{
					item.alpha = 1;
				}
			}
		}

		descText.text = creditsStuff[curSelected][2];
		descText.screenCenter(Y);
		descText.y += 270;

		descBox.setPosition(descText.x - 10, descText.y - 10);
		descBox.setGraphicSize(Std.int(descText.width + 20), Std.int(descText.height + 25));
		descBox.updateHitbox();
	}

	function getCurrentBGColor()
	{
		var bgColor:String = creditsStuff[curSelected][4];
		if (!bgColor.startsWith('0x'))
		{
			bgColor = '0xFF' + bgColor;
		}
		return Std.parseInt(bgColor);
	}

	private function unselectableCheck(num:Int):Bool
	{
		return creditsStuff[num].length <= 1;
	}
}
