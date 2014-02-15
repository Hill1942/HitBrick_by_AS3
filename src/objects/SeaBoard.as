package objects 
{
	import starling.display.Sprite;
	import starling.display.Image;
	import starling.core.Starling;
	import starling.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author Jack Yang
	 */
	public class SeaBoard extends Sprite 
	{
		private var contentImage:Image;
		public function SeaBoard() 
		{
			contentImage = new Image(Assets.getTexture("SeaBoardTexture"));
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