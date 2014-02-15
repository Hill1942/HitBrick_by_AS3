package objects 
{
	import adobe.utils.CustomActions;
	import utils.Constants;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author Jack Yang
	 */
	public class Ball extends Sprite 
	{
		private var contentImage:Image;
		public var xSpeed:int;
		public var ySpeed:int;
		public var radius:int;
		
		public function Ball() 
		{
			contentImage = new Image(Assets.getTexture("BallTexture"));
			addChild(contentImage);
			
			xSpeed = 6;
			ySpeed = 4;
			radius = this.width / 2;
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);	
		}
		
		public function stop():void
		{
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(e:Event):void
		{
			this.x += xSpeed;
			this.y += ySpeed;
			
			if (this.x <= radius)
			{
				xSpeed *= -1;
			}
			if (this.x >= Constants.SCREEN_WIDTH - radius) 
			{
				xSpeed *= -1;
			}
			if (this.y <= radius)
			{
				ySpeed *= -1;
			}
			if (this.y >= Constants.SCREEN_HEIGHTT - radius)
			{
				ySpeed *= -1;
			}			
		}
		
	}

}












