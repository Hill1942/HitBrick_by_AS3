package objects 
{
	import starling.display.Image;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author Jack Yang
	 */
	public class IceBrick extends Sprite 
	{
		private var contentImage:Image;
		
		public function IceBrick() 
		{
			contentImage =  new Image(Assets.getTexture("IceBrickTexture"));
			addChild(contentImage);
			
		}
		
	}

}