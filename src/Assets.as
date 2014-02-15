package
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	/**
	 * ...
	 * @author Jack Yang
	 */
	public class Assets 
	{
		[Embed(source = "../assets/game_bg.png")]
		public static const BgGame:Class;
		
		[Embed(source = "../assets/a.jpg")]
		public static const BgWelcome:Class;
		
		[Embed(source = "../assets/cityMapView.png")]
		public static const CityMapViewTexture:Class;
		
		[Embed(source = "../assets/iceMapView.png")]
		public static const IceMapViewTexture:Class;
		
		[Embed(source = "../assets/seaMapView.png")]
		public static const SeaMapViewTexture:Class;
			
		[Embed(source = "../assets/SeaBoard.png")]
		public static const SeaBoardTexture:Class;
		
		[Embed(source = "../assets/SeaBottom.png")]
		public static const BgSeaMap:Class;
		
		[Embed(source = "../assets/brick.png")]
		public static const BrickTexture:Class;
		
		[Embed(source = "../assets/board.png")]
		public static const BoardTexture:Class;
		
		[Embed(source = "../assets/ball.png")]
		public static const BallTexture:Class;
		
		[Embed(source = "../assets/city_map.png")]
		public static const CityMapTexture:Class;
		
		[Embed(source = "../assets/IceBrick.png")]
		public static const IceBrickTexture:Class;
		
		[Embed(source = "../assets/IceWorld.png")]
		public static const BgIceMap:Class;
		
		[Embed(source = "../assets/IceBoard.png")]
		public static const IceBoardTexture:Class;
		
		[Embed(source = "../assets/star.png")]
		public static const StarTextureAtlas:Class;
		
		[Embed(source = "../assets/star.xml", mimeType = "application/octet-stream")]
		public static const StarAtlasXML:Class;
		
		[Embed(source = "../assets/grass.png")]
		public static const GrassTextureAtlas:Class;
		
		[Embed(source = "../assets/grass.xml", mimeType = "application/octet-stream")]
		public static const GrassAtlasXML:Class;
		
		[Embed(source = "../assets/restart_citymap.png")]
		public static const RestartCityTexture:Class;
		
		[Embed(source = "../assets/restart_iceworld.png")]
		public static const RestartIceTexture:Class;
		
		[Embed(source = "../assets/restart_seaworld.png")]
		public static const RestartSeaTexture:Class;
		
		[Embed(source = "../assets/goodBtn_city.png")]
		public static const GoodBtnCityTexture:Class;
		
		[Embed(source = "../assets/goodBtn_sea.png")]
		public static const GoodBtnSeaTexture:Class;
		
		[Embed(source = "../assets/goodBtn_ice.png")]
		public static const GoodBtnIceTexture:Class;
		
		private static var gameTextures:Dictionary = new Dictionary();
		private static var textureAtlas:TextureAtlas;
		
		public function Assets() 
		{
			
		}
		
	    public static function getTexture(name:String):Texture
		{
			if (gameTextures[name] == undefined) 
			{
				var bitmap:Bitmap = new Assets[name]();
				gameTextures[name] = Texture.fromBitmap(bitmap);
			}
			return gameTextures[name];
		}
		
		public static function getAtlas():TextureAtlas
		{
			if (textureAtlas == null)
			{
				var texture:Texture = getTexture("StarTextureAtlas");
				var xml:XML = (XML) (new StarAtlasXML());
				textureAtlas = new TextureAtlas(texture, xml);
			}
			return textureAtlas;
		}
		
		public static function getGrassAtlas():TextureAtlas
		{

			var texture:Texture = getTexture("GrassTextureAtlas");
			var xml:XML = (XML) (new GrassAtlasXML());
			var textureAtlas:TextureAtlas = new TextureAtlas(texture, xml);
			return textureAtlas;
		}
		
		
		
	}

}