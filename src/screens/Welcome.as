package screens 
{
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import events.NavigationEvent;
	import starling.text.TextField;
	
	
	/**
	 * ...
	 * @author Jack Yang
	 */
	public class Welcome extends Sprite 
	{
		
		private var bg:Image;
		private var cityMapViewBtn:Button;
		private var iceMapViewBtn:Button;
		private var seaMapViewBtn:Button;
		
		private var text:TextField;

		
		public function Welcome() 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void
		{
			drawScreen();
		}
		
		private function drawScreen():void
		{
			bg = new Image(Assets.getTexture("BgWelcome"));
			this.addChild(bg);
			
			text = new TextField(600, 100, "通过W, S, D, A控制方向", "Verdana", 24, 0xffffff, true);
			text.x = 200;
			text.y = 500;
			addChild(text);
			
			cityMapViewBtn = new Button(Assets.getTexture("CityMapViewTexture"));
			cityMapViewBtn.x = 296;
			cityMapViewBtn.y = 70;
			this.addChild(cityMapViewBtn);
			
			iceMapViewBtn = new Button(Assets.getTexture("IceMapViewTexture"));
			iceMapViewBtn.x = 30;
			iceMapViewBtn.y = 210;
			this.addChild(iceMapViewBtn);
			
			seaMapViewBtn = new Button(Assets.getTexture("SeaMapViewTexture"));
			seaMapViewBtn.x = 557;
			seaMapViewBtn.y = 193;
			this.addChild(seaMapViewBtn);
			
			this.addEventListener(Event.TRIGGERED, onMainMenuClick);
		}
		
		public function initialize():void
		{
			this.visible = true;
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		public function disposeTemporarily():void
		{
			this.visible = false;
			if (this.hasEventListener(Event.ENTER_FRAME))
			{
				this.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			}
		}
		
		private function onEnterFrame(e:Event):void
		{
			var currentDate:Date = new Date();
			cityMapViewBtn.y = 70 + (Math.cos(currentDate.getTime() * 0.002) * 25);
			iceMapViewBtn.y = 210 + (Math.cos(currentDate.getTime() * 0.002) * 25);
			seaMapViewBtn.y = 193 + (Math.cos(currentDate.getTime() * 0.002) * 25);
		}
		
		private function onMainMenuClick(e:Event):void
		{
			var clickedButton:Button = e.target as Button;
			if ((clickedButton as Button) == cityMapViewBtn) 
			{
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, { id: "playCityMap" }, true));
			}
			if ((clickedButton as Button) == iceMapViewBtn) 
			{
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, { id: "playIceMap" }, true));
			}
			if ((clickedButton as Button) == seaMapViewBtn) 
			{
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, { id: "playSeaMap" }, true));
			}
			
			
		}
		
		
		
		
		
	}

}