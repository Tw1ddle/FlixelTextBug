package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;

// FlxText with a border and some extra paranoid hitbox updates
class BodyText extends FlxText {
	public function new(text:String, size:Int, font:String) {
		super(0, 0, 0, text, size);
		this.font = font;
		setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 1, 1);
		updateHitbox();
	}
	
	override private function set_text(text:String):String {
		super.set_text(text);
		updateHitbox();
		return text;
	}
}

class PlayState extends FlxState {
	override public function create():Void {
		super.create();
		
		bgColor = FlxColor.GRAY;
		
		// Notice that the hitbox seems to clip the accent on the e-acute.
		// This is not the case on Windows, where characters appear to be clipped.
		var text = new BodyText("Acute-é, ç, huh...?", 48, "upheaval");
		text.screenCenter(FlxAxes.XY);
		add(text);
	}
}