package objects 
{
	import flash.geom.Rectangle;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.core.Starling;
	import starling.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author Jack Yang
	 */
	public class Board extends Sprite 
	{
		private var contentImage:Image;
		private var rect:Rectangle;
		
		public function Board() 
		{
			contentImage = new Image(Assets.getTexture("BoardTexture"));
			addChild(contentImage);
			
			rect = new Rectangle(this.x, this.y, this.width, this.height);
			
			Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
		private function onKeyDown(e:KeyboardEvent):void
		{
			if (e.keyCode == 65)
			{
				if (this.x <= 0)
			    {
				    this.x == 0;
			    }
				else {
				    this.x -= 15;
				}
			}
			if (e.keyCode == 68)
			{
				if (this.x >= 640)
				{
					this.x == 640
				}
				else {
					this.x += 15;
				}			
			}
		}
		
		public function getRect():Rectangle
		{
			return rect;
		}
		
	}

}