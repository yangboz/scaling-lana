package D5Power.Objects 
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	//import D5Power.Objects.hitMC;
	public class Stone extends gameObject
	{
		//定义石头
		public function Stone(face:MovieClip) 
		{
			super();
			addChild(face);
			_hitTest = true;
			
			//hitmc =new hitMC;
			hitmc.x = 0;
			hitmc.y = 0;
			addChild(hitmc);
			
		}
		
	}
	
	
	
	
}