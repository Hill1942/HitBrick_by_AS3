package screens 
{
	import objects.Brick;
	import objects.IceBoard;
	import objects.IceBrick;
	import objects.Ball;
	import starling.display.Image;
	import utils.Constants;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.display.Button;
	import com.greensock.TweenLite;
	import events.NavigationEvent;
	
	
	/**
	 * ...
	 * @author Jack Yang
	 */
	public class IceMap extends Sprite 
	{
		private var bg:Image;
		
		private var column:int;
		private var row:int;

		private var iceBoard:IceBoard;
		private var ball:Ball;
		private var iceBricks:Vector.<IceBrick>;
		
		private var scoreText:TextField;
		private var score:int;
		
		private var restartBtn:Button;
		private var goodBtn:Button;
		
		public function IceMap() 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
			iceBricks = new Vector.<IceBrick>();
			
		}
		
		private function onAdded(e:Event):void
		{
			drawScreen();
			scoreText = new TextField(1300, 100, "Score: 0", "Verdana", 24, 0xffffff, true);
			this.addChild(scoreText);
			
			restartBtn = new Button(Assets.getTexture("RestartIceTexture"));
			restartBtn.x = Constants.SCREEN_WIDTH / 2 - restartBtn.width / 2;
			restartBtn.y = -restartBtn.height;
			addChild(restartBtn);
			
			goodBtn = new Button(Assets.getTexture("GoodBtnIceTexture"));
			goodBtn.x = Constants.SCREEN_WIDTH / 2 - restartBtn.width / 2;
			goodBtn.y = -goodBtn.height;
			addChild(goodBtn);
			
			this.addEventListener(Event.TRIGGERED, onMainMenuClick);
		}
		
		private function removeAll():void
		{
			removeChild(bg);
			for (var i:uint = 0; i < iceBricks.length; i++)
			{
				var iceBrick:IceBrick = iceBricks[i];
				removeChild(iceBrick);
			}
			removeChild(scoreText);
			removeChild(ball);
			removeChild(iceBoard);
			delete this;
			
		}
		
		private function onMainMenuClick(e:Event):void
		{
			var clickedButton:Button = e.target as Button;
			if ((clickedButton as Button) == restartBtn) 
			{
				removeChild(restartBtn);
				removeAll();
				dispatchEvent(new NavigationEvent(NavigationEvent.TO_START, null, true));
			}
			
			if ((clickedButton as Button) == goodBtn) 
			{
				removeChild(goodBtn);
				removeAll();
				dispatchEvent(new NavigationEvent(NavigationEvent.TO_START, null, true));
			}
		}
		
		public function initialize():void 
		{
			this.visible = true;
			iceBoard = new IceBoard();
			iceBoard.x = Constants.SCREEN_WIDTH / 2 - iceBoard.width / 2;
			iceBoard.y = Constants.SCREEN_HEIGHTT - 30;
			addChild(iceBoard);
			
			ball = new Ball();
			ball.x = Constants.SCREEN_WIDTH / 2 - ball.width / 2;
			ball.y = Constants.SCREEN_HEIGHTT - 50;
			addChild(ball);		
			
			addEventListener(Event.ENTER_FRAME, onGameTick);
		}
		
		private function drawScreen():void
		{
			bg = new Image(Assets.getTexture("BgIceMap"));
			addChild(bg);
				
			for (var i:uint = 0; i < 120; i++)
			{
				column = i % 15;
				row = i / 15;
				if (Constants.MAP3[i] == 1)
				{
					createIceBrick(row, column);
				}	
			}
		}
		
		private function createIceBrick(row:int, column:int):void
		{
			var iceBrick:IceBrick = new IceBrick();
			iceBrick.x = 62 + column * iceBrick.width;
			iceBrick.y = 80 + row * iceBrick.height;
			addChild(iceBrick);
			iceBricks.push(iceBrick);
		}
		
		public function disposeTemporarily():void
		{
			this.visible = false;
		}
		
		private function onGameTick(e:Event):void
		{
			if (ball.bounds.intersects(iceBoard.bounds))
			{
				ball.ySpeed *= -1;
			}
			
			if (ball.y >= 580)
			{
				TweenLite.to(restartBtn, 2, { y:280 } );
				removeEventListener(Event.ENTER_FRAME, onGameTick);
				ball.stop();
			}
			
			
			if (score >= 920)
			{
				TweenLite.to(goodBtn, 2, { y:280 } );
				removeEventListener(Event.ENTER_FRAME, onGameTick);
				ball.stop();
			}
			
			var iceBrick:IceBrick;
			for (var i:uint = 0; i < iceBricks.length; i++)
			{
				iceBrick = iceBricks[i];
				if (iceBrick.bounds.intersects(ball.bounds))
				{
					if (ball.y + ball.radius >= iceBrick.y && iceBrick.y - ball.radius <= iceBrick.y + iceBrick.height)
					{
						ball.xSpeed *= -1;
					}
					else {
						ball.ySpeed *= -1;
						
					}
					iceBricks.splice(i, 1);
					this.removeChild(iceBrick);
					
					score += 10;
					
					scoreText.text = "Score: " + score;
				}
			}
		}
		
	}

}