package screens
{
	import flash.geom.Rectangle;
	import objects.Ball;
	import starling.text.TextField;
	import utils.Constants;
	import objects.Board;
	import objects.Brick;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent
	import com.greensock.TweenLite;
	import starling.display.Button;
	import events.NavigationEvent;
	/**
	 * ...
	 * @author Jack Yang
	 */
	public class CityMap extends Sprite
	{
		private var bg:Image;
		public var board:Board;
		private var ball:Ball;
		
		private var column:int;
		private var row:int;
		
		private var bricks:Vector.<Brick>
		
		private var scoreText:TextField;
		private var score:int;
		
		private var restartBtn:Button;
		private var goodBtn:Button;
		
		public function CityMap() 
		{
			bricks = new Vector.<Brick>();	
			drawScreen();	
			scoreText = new TextField(1300, 100, "Score: 0", "Verdana", 24, 0xffffff, true);
			this.addChild(scoreText);
			
			restartBtn = new Button(Assets.getTexture("RestartCityTexture"));
			restartBtn.x = Constants.SCREEN_WIDTH / 2 - restartBtn.width / 2;
			restartBtn.y = -restartBtn.height;
			addChild(restartBtn);
			
			goodBtn = new Button(Assets.getTexture("GoodBtnCityTexture"));
			goodBtn.x = Constants.SCREEN_WIDTH / 2 - restartBtn.width / 2;
			goodBtn.y = -goodBtn.height;
			addChild(goodBtn);
			
			this.addEventListener(Event.TRIGGERED, onMainMenuClick);
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
		
		private function removeAll():void
		{
			removeChild(bg);
			for (var i:uint = 0; i < bricks.length; i++)
			{
				var brick:Brick = bricks[i];
				removeChild(brick);
			}
			removeChild(scoreText);
			removeChild(ball);
			removeChild(board);
			delete this;
			
		}
		
		public function initialize():void
		{
			this.visible = true;
			board = new Board();
			board.name = "board";
			board.x = Constants.SCREEN_WIDTH / 2 - board.width / 2;
			board.y = Constants.SCREEN_HEIGHTT - 30;
			this.addChild(board);
			
			ball = new Ball();
			ball.name = "ball";
			ball.x = Constants.SCREEN_WIDTH / 2 - ball.width / 2;
			ball.y = Constants.SCREEN_HEIGHTT - 50;
			this.addChild(ball);
			
			addEventListener(Event.ENTER_FRAME, onGameTick);
		}
		
		
		public function drawScreen():void
		{
			bg = new Image(Assets.getTexture("BgGame"));
			this.addChild(bg);
			
			for (var i:int = 0; i < 135; i++)
			{
				row = i / 15;
				column = i % 15;
				if (Constants.MAP1[i] == 1)
				{
					drawBrick(row, column);			
				}
				
			}			
		}
		
		
		private function drawBrick(row:int, column:int):void
		{
			var brick:Brick = new Brick();
			brick.name = "brick" + (row * 15 + column).toString();
			brick.x = 60 + column * brick.width;
			brick.y = 80 + row * brick.height;
			addChild(brick);
			bricks.push(brick);
		}
		
		public function disposeTemporarily():void
		{
			this.visible = false;
		}
		
		private function onGameTick(e:Event):void
		{
			if (ball.bounds.intersects(board.bounds))
			{
				ball.ySpeed *= -1;
			}
			
			if (ball.y >= 580)
			{
				TweenLite.to(restartBtn, 2, { y:280 } );
				removeEventListener(Event.ENTER_FRAME, onGameTick);
				ball.stop();
			}
			
			if (score >= 890)
			{
				TweenLite.to(goodBtn, 2, { y:280 } );
				removeEventListener(Event.ENTER_FRAME, onGameTick);
				ball.stop();
			}
			
			var brick:Brick;
			for (var i:uint = 0; i < bricks.length; i++)
			{
				brick = bricks[i];
				if (brick.bounds.intersects(ball.bounds))
				{
					if (ball.y + ball.radius >= brick.y && brick.y - ball.radius <= brick.y + brick.height)
					{
						ball.xSpeed *= -1;
					}
					else {
						ball.ySpeed *= -1;
						
					}
					bricks.splice(i, 1);
					this.removeChild(brick);
					score += 10;
					
					scoreText.text = "Score: " + score;
				}
			}
			
		}
		

	}
}



















