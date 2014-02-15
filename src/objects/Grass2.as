package objects 
{
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author Jack Yang
	 */
	public class Grass2 extends Sprite 
	{
		
		private var grass2Animation:MovieClip;
		public function Grass2() 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			createGrass2Animation();
		}
		
		private function createGrass2Animation():void
		{
			grass2Animation = new MovieClip(Assets.getGrassAtlas().getTextures("grass2_"), 5);
			Starling.juggler.add(grass2Animation);
			this.addChild(grass2Animation);
		}
		
	}

}