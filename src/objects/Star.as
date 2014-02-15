package objects 
{
	import starling.display.Sprite;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author Jack Yang
	 */
	public class Star extends Sprite 
	{
		
		//private var star_type:int;
		private var starImage:Image;
		
		public function Star(starType:int) 		
		{
			super();
			
			starImage = new Image(Assets.getAtlas().getTexture("Star" + starType));
			//starImage.x = -starImage.texture.width * 0.5;
			//starImage.y = -starImage.texture.height * 0.5;
			addChild(starImage);

		}
	}

}