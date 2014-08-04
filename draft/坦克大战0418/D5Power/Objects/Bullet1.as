package D5Power.Objects 
{
	import flash.display.MovieClip;
	// 子弹类
	public class Bullet1 extends BulletObject
	{
		
		public function Bullet1(shooter:ActionObject,_bulletface:MovieClip) 
		{ 	
			super(shooter,_bulletface);
			_speed = 10;
			//_shooter = shooter;
			//_direction = _shooter.direction;
			//	_face = _bulletface;
			//	addChild(_face);
		
		}
		override public function Do():void 
		{	
			trace("飞行中")
			//飞行中
			switch(_direction)
			{
				case ActionObject.UP:
					y -= _speed;
					break;
				case ActionObject.DOWN:
					y += _speed;
					break;
				case ActionObject.LEFT:
					x -= _speed;
					break; 
				case ActionObject.RIGHT:
					x += _speed;
					break;
				default:break;
			}
			DoHiting();
		}
		
		//飞行过程中检测碰撞
		override protected function DoHiting():void
		{
			//遍历容器里所有对象检测碰撞
			for each(var obj:gameObject in Global.scene.AllObject)
			{
				if (obj.hitTest&&obj.hitmc.hitTestPoint(x, y, true) && obj.part!=_shooter.part && obj!=this)
				//if (obj.hitTestPoint(x, y, true) && obj!=_shooter && obj!=this)
				{
					//trace("击中目标")
					 if (!obj.hitTest) continue;		
					//obj.Hurt(20);
					//(obj as Trees).Hurt(20);
					//爆炸函数
					showBoom();
					//检查该类对象是否含有某方法或某属性 fi有 返回真继续执行
					//对象转换成 FaceObject    并执行函数 减血Hurt(带参数20);
					//	if(obj.hasOwnProperty('Hurt')) (obj as FaceObject).Hurt(20);
					if(obj.hasOwnProperty('Hurt')) (obj as gameObject).Hurt(10);	 
					Global.scene.removeObject(this);
					trace("执行die 1")
					//注意删除方法放在全局静态变量gameScene.removeObject(this);调用
					 //die();
					break;
					 
				}
			}
			//如果子弹碰撞边缘 爆炸
			if (x<0 || x>Global.stage.stageWidth || y<0 || y>Global.stage.stageHeight)
			{
			showBoom();
			Global.scene.removeObject(this);
			trace("执行die 2")	 
			}
		}
	}
}