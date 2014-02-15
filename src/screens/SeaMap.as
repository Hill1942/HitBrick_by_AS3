package screens
{
	import events.NavigationEvent;
	import objects.Ball;
	import objects.Grass1;
	import objects.Grass2;
	import objects.Grass3;
	import objects.Grass4;
	import objects.SeaBoard;
	import starling.display.Button;
	import starling.display.Image;
	import starling.text.TextField;
	import utils.Constants;
	import objects.Star;
	import starling.display.Sprite;
	import starling.events.Event;
	import com.greensock.TweenLite;
	
	/**
	 * ...
	 * @author Jack Yang
	 */
	public class SeaMap extends Sprite 
	{
		private var column:int;
		private var row:int;
		
		private var bg:Image;

		private var seaBoard:SeaBoard;
		private var ball:Ball;
		private var stars:Vector.<Star>;
		private var grass1:Grass1;
		private var grass2:Grass2;
		private var grass3:Grass3;
		private var grass4:Grass4;
		
		private var score:int;
		private var scoreText:TextField;
		private var starNumbers:int;
		
		private var restartBtn:Button;
		private var goodBtn:Button;
		
		public function SeaMap() 
		{
			stars = new Vector.<Star>();
			starNumbers = 0;
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void
		{
			drawScreen();
			scoreText = new TextField(1300, 100, "Score: 0", "Verdana", 24, 0xffffff, true);
			this.addChild(scoreText);
			
			restartBtn = new Button(Assets.getTexture("RestartSeaTexture"));
			restartBtn.x = Constants.SCREEN_WIDTH / 2 - restartBtn.width / 2;
			restartBtn.y = -restartBtn.height;
			addChild(restartBtn);
			
			goodBtn = new Button(Assets.getTexture("GoodBtnSeaTexture"));
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
		
		public function initialize():void
		{
			this.visible = true;
			seaBoard = new SeaBoard();
			seaBoard.x = Constants.SCREEN_WIDTH / 2 - seaBoard.width / 2;
			seaBoard.y = Constants.SCREEN_HEIGHTT - 30;
			addChild(seaBoard);
			
			ball = new Ball();
			ball.x = Constants.SCREEN_WIDTH / 2 - ball.width / 2;
			ball.y = Constants.SCREEN_HEIGHTT - 50;
			addChild(ball);
			
			grass1 = new Grass1();
			grass1.x = 86;
			grass1.y = 349;
			addChild(grass1);
			
			grass2 = new Grass2();
			grass2.x = 40;
			grass2.y = 229;
			addChild(grass2);
			
			grass3 = new Grass3();
			grass3.x = 50;
			grass3.y = 229;
			addChild(grass3);
			
			grass4 = new Grass4();
			grass4.x = 195;
			grass4.y = 345;
			addChild(grass4);
			
			addEventListener(Event.ENTER_FRAME, onGameTick);
			
		}
		
		private function drawScreen():void
		{
			bg = new Image(Assets.getTexture("BgSeaMap"));
			addChild(bg);
			
			for (var i:uint = 0; i < 105; i++)
			{
				column = i % 15;
				row = i / 15;
				if (Constants.MAP2[i] == 1)
				{
					createStar(row, column);
					starNumbers++;
				}	
			}
		}
		
		private function removeAll():void
		{
			removeChild(bg);
			for (var i:uint = 0; i < stars.length; i++)
			{
				var star:Star = stars[i];
				removeChild(star);
			}
			removeChild(scoreText);
			removeChild(grass1);
			removeChild(grass2);
			removeChild(grass3);
			removeChild(grass4);
			removeChild(ball);
			removeChild(seaBoard);
			delete this;
			
		}
		
		private function createStar(row:int, column:int):void
		{
			var star:Star = new Star(Math.floor(Math.random() * 5));
			star.x = 100 + column * star.width;
			star.y = 50 + row * star.height;
			star.rotation = Math.random();
			addChild(star);
			stars.push(star);
		}
		
		public function disposeTemporarily():void
		{
			this.visible = false;
		}
		
		private function onGameTick(e:Event):void
		{
			if (ball.bounds.intersects(seaBoard.bounds))
			{
				ball.ySpeed *= -1;
			}
			
			if (ball.y >= 580)
			{
				TweenLite.to(restartBtn, 2, { y:280 } );
				removeEventListener(Event.ENTER_FRAME, onGameTick);
				ball.stop();
			}
			
			if (score >= 810)
			{
				TweenLite.to(goodBtn, 2, { y:280 } );
				removeEventListener(Event.ENTER_FRAME, onGameTick);
				ball.stop();
			}
			
			var star:Star;
			for (var i:uint = 0; i < stars.length; i++)
			{
				star = stars[i];
				if (star.bounds.intersects(ball.bounds))
				{
					if (ball.y + ball.radius >= star.y && ball.y - ball.radius <= star.y + star.height)
					{
						ball.xSpeed *= -1;
					}
					else {
						ball.ySpeed *= -1;
						
					}
					
					stars.splice(i, 1);
					this.removeChild(star);
					
					score += 10;
					
					scoreText.text = "Score: " + score;
				}
			}
		}
	}

}