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
	public class Grass4 extends Sprite 
	{
		
		private var grass4Animation:MovieClip;
		public function Grass4() 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			createGrass4Animation();
		}
		
		private function createGrass4Animation():void
		{
			grass4Animation = new MovieClip(Assets.getGrassAtlas().getTextures("grass4_"), 5);
			Starling.juggler.add(grass4Animation);
			this.addChild(grass4Animation);
		}
		
	}

}