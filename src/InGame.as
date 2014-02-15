package  
{
	import screens.CityMap;
	import screens.IceMap;
	import screens.SeaMap;
	import screens.Welcome;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import events.NavigationEvent;
	
	/**
	 * ...
	 * @author Jack Yang
	 */
	public class InGame extends Sprite 
	{
		private var welcomeScreen:Welcome;
		private var cityMapScreen:CityMap;
		private var iceMapScreen:IceMap;
		private var seaMapScreen:SeaMap;
		
		public function InGame() 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void
		{
			this.addEventListener(NavigationEvent.CHANGE_SCREEN, onChangeScreen);
			this.addEventListener(NavigationEvent.TO_START, toStart);

			welcomeScreen = new Welcome();
			welcomeScreen.initialize();
			addChild(welcomeScreen);
			
			
		}
		
		private function onChangeScreen(e:NavigationEvent):void
		{
			switch (e.params.id)
			{
				case "playCityMap":
					welcomeScreen.disposeTemporarily();
					cityMapScreen = new CityMap();
					addChild(cityMapScreen);
					cityMapScreen.initialize();					
					break;
				case "playIceMap":
					welcomeScreen.disposeTemporarily();
					iceMapScreen = new IceMap();
					addChild(iceMapScreen);
					iceMapScreen.initialize();				
					break;
				case "playSeaMap":
					welcomeScreen.disposeTemporarily();
					seaMapScreen = new SeaMap();
					addChild(seaMapScreen);
					seaMapScreen.initialize();
					
					break;
			}
		}
		
		private function toStart(e:NavigationEvent):void {
			welcomeScreen.initialize();
			
		}
		
	}

}