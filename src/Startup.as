package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	//import net.hires.debug.Stats;
	import screens.IceMap;
	import screens.SeaMap;
	import screens.CityMap;
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author Jack Yang
	 */
	[SWF(width = "800", height = "600", backgroundColor = "0x666666", frameRate = "60")]
	public class Startup extends Sprite 
	{
		private var mStarling:Starling;
		
		public function Startup():void 
		{
			//addChild(new Stats());
			mStarling = new Starling(InGame, stage);
			mStarling.antiAliasing = 1;
			mStarling.start();
		}
		

	}
	
}