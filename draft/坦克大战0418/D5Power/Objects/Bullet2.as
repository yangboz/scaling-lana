package D5Power.Objects 
{
	import flash.display.MovieClip;
	
	import flash.events.TimerEvent;
	//import flash.geom.Point;
	import flash.utils.Timer;
	

	
	
	// 子弹类
	public class Bullet2 extends BulletObject
	{
		var _do:int=1;//动作状态
		//var _obj:gameObject;//临时对象
		//protected var _speed:Number;
		//var timer:Timer = new Timer(20);
		public function Bullet2(shooter:ActionObject,_bulletface:MovieClip) 
		{ 	
			super(shooter,_bulletface);
			_speed = 3;
			//帧频参数设置！ 帧数渲染时间
			//this.frameRate = 240;
			//_shooter = shooter;
			//_direction = _shooter.direction;
			//	_face = _bulletface;
			//	addChild(_face);
			
			//定义了一个时间间隔是30秒的定时器，每次都会运行createItem方法来创建道具30000=30秒
			//timer.addEventListener(TimerEvent.TIMER, Do2);
			//timer.start();
		}
		override public function Do():void 
		{	trace("_dox",_do)
			if(_do==1)
			{
				if(_speed<40&&_speed>=3)
				{_speed=_speed+3}
				trace("1111111111111111111111111")
				switch(_direction)
				{
					case ActionObject.UP:
							if( scaleX <10)
						{scaleX =scaleX+1;}
						rotation=-90;
						y -= _speed;   
						break;
					case ActionObject.DOWN:
						if( scaleX <10)
						{scaleX =scaleX +1;}
						rotation=90;
						y += _speed;
						break;
					case ActionObject.LEFT:
							if( scaleX >-10)
							{scaleX =scaleX -1;}
						x -= _speed;
						break; 
					case ActionObject.RIGHT:
							if( scaleX <10)
							{scaleX=scaleX +1;}
						x += _speed;
						break;
					default:break;
				}
				DoHiting();
			}
			if(_do==2)
			{	trace("_doxx",_do)
				if(scaleX <=2&&scaleX >=-2)
					{
						showBoom(); 
						Global.scene.removeObject(this);
						 
					}
				if(scaleX>2)
					{
						trace("scaleX",scaleX)
						scaleX=scaleX-2}
				if(scaleX<-2)
					{	trace("scaleX",scaleX)
						scaleX=scaleX+2}
				
			}
		}
		/*public function Do2(e:TimerEvent):void 
		{	
			//飞行中
			switch(_direction)
			{
				case ActionObject.UP:
						if( scaleX <100)
					{scaleX =scaleX +1;}
					rotation=-90;
					y -= _speed;   
					break;
				case ActionObject.DOWN:
					if( scaleX <100)
					{scaleX =scaleX +1;}
					rotation=90;
					y += _speed;
					break;
				case ActionObject.LEFT:
						if( scaleX <100)
						{scaleX =scaleX -1;}
					x -= _speed;
					break; 
				case ActionObject.RIGHT:
						if( scaleX <100)
						{scaleX=scaleX +1;}
					x += _speed;
					break;
				default:break;
			}
			DoHiting();
		}*/
		
		//飞行过程中检测碰撞
		override protected function DoHiting():void
		{
			//遍历容器里所有对象检测碰撞
			for each(var obj:gameObject in Global.scene.AllObject)
			{
				//if (obj.hitTest&&obj.hitmc.hitTestPoint(x, y, true) && obj.part!=_shooter.part && obj!=this)
				if (obj.hitTest&&obj.hitmc.hitTestObject(this) && obj.part!=_shooter.part && obj!=this)
				//if (obj.hitTestPoint(x, y, true) && obj!=_shooter && obj!=this)
				{
					//trace("击中目标")
					 if (!obj.hitTest) continue;		
					// obj  .Hurt(20);
					//(obj as Trees).Hurt(20);
					_do=2
					//mingzhong();
					 
						if(obj.hasOwnProperty('Hurt')) (obj as gameObject).Hurt(40);	 
						//_obj=obj;
						trace("执行die 1")
				 
					//检查该类对象是否含有某方法或某属性 fi有 返回真继续执行 as验证对象是gameObject 并返回对象本身！
					//对象转换成 FaceObject    并执行函数 减血Hurt(带参数20);
					//	if(obj.hasOwnProperty('Hurt')) (obj as FaceObject).Hurt(20);
					
					//注意删除方法放在全局静态变量gameScene.removeObject(this);调用
					 //die();
					//timer.removeEventListener(TimerEvent.TIMER, Do2);
					break;
					 
				}
			}
			//如果子弹碰撞边缘 爆炸
			//if ( x+this.width>Global.stage.stageWidth ||Global.stage.stageHeight-y-this.height<0 || y+this.height>Global.stage.stageHeight)
			if (x<0 || x>Global.stage.stageWidth || y<0 || y>Global.stage.stageHeight)
			{
			showBoom(); 
			Global.scene.removeObject(this);
			trace("执行die 2")	 
			}
		}
		
		
		 
		
		
	}
}