package objects 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.KeyboardEvent;
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author Jack Yang
	 */
	public class IceBoard extends Sprite 
	{
		private var contentImage:Image;
		public function IceBoard() 
		{
			contentImage = new Image(Assets.getTexture("IceBoardTexture"));
			addChild(contentImage);
			
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
	}

}