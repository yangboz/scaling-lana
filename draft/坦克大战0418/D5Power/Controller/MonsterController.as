package D5Power.Controller
{
	import D5Power.Objects.Monster;
	import D5Power.Objects.ActionObject;	//安装D5Power.Objects.ActionObject
	import D5Power.Objects.gameObject;		//安装D5Power.Objects.gameObject
	//import flash.events.KeyboardEvent;
	import flash.display.MovieClip;

	//键盘控制器
	 
	public class MonsterController extends basicController
	{	
		//最后一次射击时间
		protected var lastShoot:Date;
		//射击间隔，单位秒
		protected var shootSpeed:uint = 10;
		
		
		
		trace("MonsterController")
		public function MonsterController() 
		{
			lastShoot = new Date();
			super();
		}
		//覆盖父类的控制对象
		override public function set target(obj:gameObject):void
		{
			_target = obj;
			trace("_target~~~~~~~~~~~~~~~~~~~~~~~x",_target) // 输出 [object Monster]
			changeDir(); // 在本类中增加AI智能
		}	
		//自动射击的概率数
		var timp = 9;
		
		override public function AutoRun():void
		{
			//trace("_target  ? =",_target)
			//trace("Monster",Monster)
			var me:Monster = _target as Monster;
			//trace("me:Monster =",me)
			// 自动射击
			var now:Date = new Date();
			//trace("timp1",timp);
			var iii:int;
			if(now.time-lastShoot.time>shootSpeed*(timp*50))        // 当距离上一次射击的时间间隔超过规定时间时运行
			{		
					if ( ( iii=Math.random()*10)<timp)
					{
					//trace("timp1",timp);
					me.Shoot();        // 射击！
					lastShoot = now;// 更新最后一次射击时间
					timp -= 2;//减少概率
					}
					else {
						timp +=1; //增加开火概率
						lastShoot = now;// 更新最后一次射击时间
					//trace("timp2",timp);
					changeDir();
					}
			}
			
			if (!me.nextCanMove) changeDir();
			//基地base被设置 基地x.y.轴范围10像素为60%概率向基地靠近射击
			/*if(Global.base!=null && (Math.abs(me.x-Global.base.x)<10 || Math.abs(me.y-Global.base.y)<10))
			{
				if(Math.random()>0.6) return;
				if(now.time - lastShoot.time<2000) return;
				var tempDir:uint = me.direction; // 临时记录方向
				// 转向基地
				var r:Number = Math.atan2(me.y-Global.base.y,me.x-Global.base.x);
				var a:int = r/Math.PI*180;
				
				if(a>80 && a<100)
				{
					me.direction = ActionObject.UP;
				}else if(a>170 && a<190){
					me.direction = ActionObject.RIGHT;
				}else if(a>260 || a<-80){
					me.direction = ActionObject.DOWN;
				}else{
					me.direction = ActionObject.RIGHT;
				}
				me.Shoot();
				lastShoot = now;
				me.direction = tempDir;
			}
			*/
		}
		//  随机修改方向
		private function changeDir():void
		{
			var me:ActionObject = _target as ActionObject;
			//me.direction = 1+int(Math.random() * 4);
			me.direction = 1+int(Math.random() * 4);
			//trace("me.directionxxxxxxxxxxxxxxxxxxxxxxxxxxx")
			me.isWalk = true; // 增加了这一句
		}
		
	}
}