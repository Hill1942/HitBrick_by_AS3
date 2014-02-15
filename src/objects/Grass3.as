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
	public class Grass3 extends Sprite 
	{
		
		private var grass3Animation:MovieClip;
		public function Grass3() 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			createGrass3Animation();
		}
		
		private function createGrass3Animation():void
		{
			grass3Animation = new MovieClip(Assets.getGrassAtlas().getTextures("grass3_"), 5);
			Starling.juggler.add(grass3Animation);
			this.addChild(grass3Animation);
		}
		
	}

}