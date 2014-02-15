package objects 
{
	import flash.geom.Rectangle;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.KeyboardEvent;
	import starling.events.Event;
	/**
	 * ...
	 * @author Jack Yang
	 */
	public class Brick extends Sprite
	{
		private var contentImage:Image;
		private var rect:Rectangle;
		
		
		public function Brick() 
		{
			contentImage = new Image(Assets.getTexture("BrickTexture"));
			addChild(contentImage);		
			
			rect = new Rectangle(this.x, this.y, this.width, this.height);
				
		}
		
		public function getRect():Rectangle
		{
			return rect;
		}
		

		
		
	}

}