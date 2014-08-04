package D5Power.Objects 
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import D5Power.Controller.basicController;
	//import D5Power.Objects.hitMC;
	public class Trees extends gameObject
	{
		//定义树
		  var _hp:uint = 40;
		public function Trees(face:MovieClip) 
		{
			super();
			addChild(face);
			//能被碰撞
			_hitTest = true;
			//碰撞坐标
			hitmc.x = 0;
			hitmc.y = 0;
			//trace("hitmcxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",hitmc)
			addChild(hitmc);
			
			
			
		}
			
		
		
		
			  public function get HP():uint
			{
				return _hp;
			}
		
			override public function Hurt(val:uint):void
		 	{
		 	_hp -= val;
		 	if (_hp <= 0) die();
		 	}
		
		
			override public function die():void
			{	
				//removeChild(_face);
				Global.scene.removeObject(this);
				trace("Tress删除————————")
			}
		
		
	}
	
	
	
	
}