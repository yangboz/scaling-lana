package D5Power.Objects 
{
	import flash.display.MovieClip;
	// 子弹类
	public class BulletObject extends gameObject
	{
		//子弹发射人
		protected var _shooter:ActionObject;
		//子弹飞行速度
		protected var _speed:Number;
		//子弹的飞行方向
		protected var _direction:uint;
		//protected var _bulletface:MovieClip;
		
		//shooter	子弹发射人
		public function BulletObject(shooter:ActionObject,_bulletface:MovieClip) 
		{
			_speed = 10;
			_shooter = shooter;
			_direction = _shooter.direction;
			//_face = _bulletface;
			addChild(_bulletface);
		}
		//子弹的飞行过程
		override public function Do():void 
		{	
			 
		}
		//飞行过程中检测碰撞
		protected function DoHiting():void
		{
			 
		}
		
		//子弹爆炸
		protected function showBoom():void
		{
			var boom:BoomEffect = new BoomEffect(new boom01());
			boom.x = x;
			boom.y = y;
			Global.scene.addObject(boom);
		}
		//子弹删除
		override public function die():void
		{
			trace("子弹删除1")
			//removeChild(_bulletface);
			//graphics.clear();
			trace("子弹删除2")
			Global.scene.removeObject(this);
		}
	}
}