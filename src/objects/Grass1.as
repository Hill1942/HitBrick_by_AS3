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
	public class Grass1 extends Sprite 
	{
		
		private var grass1Animation:MovieClip;
		public function Grass1() 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			createGrass1Animation();
		}
		
		private function createGrass1Animation():void
		{
			grass1Animation = new MovieClip(Assets.getGrassAtlas().getTextures("grass1_"), 5);
			grass1Animation.x = Math.ceil( -grass1Animation.width / 2);
			grass1Animation.y = Math.ceil( -grass1Animation.height / 2);
			Starling.juggler.add(grass1Animation);
			this.addChild(grass1Animation);
		}
		
	}

}