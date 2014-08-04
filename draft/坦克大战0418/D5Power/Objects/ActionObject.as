package D5Power.Objects 
{
	import D5Power.Controller.basicController;
	import D5Power.Controller.btnimg;
	//可活动的游戏对象
	public class ActionObject extends gameObject
	{
		//移动速度
		protected var speedObject:uint =2;
		protected var speed:uint=2;
		//移动方向 私有变量 通过set方法 改变私有变量的方向
		protected var walkDirection:uint=1;
		
		public static const UP:uint = 1;
		public static const DOWN:uint = 2;
		public static const LEFT:uint = 3;
		public static const RIGHT:uint = 4;
		
		//外部类设置移动速度
		public function set Speedset(val:uint):void
		{
			speedObject = val;
		}
		public function get Speedget():uint
		{
			return speedObject;
		}
		//是否移动
		protected var _isWalk:Boolean = false;
		public function set isWalk(val:Boolean):void
		{
			_isWalk = val;
			speed=speedObject;
			trace("_isWalk",_isWalk)
			//trace("speed",speed)
		}
		//碰撞检测点
		//protected var _hitPoint:Array =  [[-20,0],[0,0],[20,0],[20,20],[20,40],[0,40],[ -20,40],[ -20,20],[-20,0],[0,0]];//末尾两组方便索引所以重复
		//protected var _hitPoint:Array =  [[-19,1],[0,1],[19,1],[19,19],[19,38],[0,38],[ -19,38],[ -19,19],[-19,1],[0,1]];//末尾两组方便索引所以重复
		protected var _hitPoint:Array =  [[-18,2],[0,2],[18,2],[19,20],[18,38],[0,38],[ -18,38],[ -18,20],[-18,2],[0,2]];//末尾两组方便索引所以重复
		//控制器
		//protected var controller:basicController; //声明protected受保护的属性controller 为basicController类
		//protected var controller:basicController; 
		protected var controller2:basicController; 
	
		//protected var controller2:btnimg; //如果添加键盘控制器的话需要添加第二个控制函数
		trace("controller")
		//在建立对象的时候，需要传递控制器进来
		//public function ActionObject(ctrl:basicController)  //function 函数名(参数：数据类型＝默认值)：数据类型
		public function ActionObject(ctrl2:basicController)  //将两个控制器传给对象
		{ 	
			trace("14")
			super();
			//controller = ctrl;
			controller2 = ctrl2;
			
			trace("this",this)
			trace("15",controller2)
			//controller.target = this;	
			controller2.target = this;	//将控制器的控制目标设置为自己
			_hitTest = true;	//打开碰撞检测开关
			trace("16")
		}
		
		//修改移动方向
		public function set direction(dir:uint):void  //取direction函数(dir参数：类型uint)没有返回值
		{	
			//trace("walkDirection",walkDirection)
			walkDirection = dir; // 
			//trace("walkDirection2",walkDirection)
		}
		public function get direction():uint
		{
			return walkDirection;
		}
		//布尔函数！ 如果有谁给nextCanMove返回给一个true参数就一直执行
		public function get nextCanMove():Boolean
		{		
				//trace(nextCanMove) 
				//下一X位置
				var nx:uint = x; //uint(无符号,32位整型,0~2147483647),int(带符号,32位整型,-2147483648~2147483647),
				//下一Y位置
				var ny:uint = y;
				var xy: int ;
				var _hitPointxx:Array 
				//根据移动方向进行处理，计算出下一目标点位置
				switch(walkDirection)
				{
						case UP:
							ny = y-speed;
							xy = -1;
							_hitPointxx = _hitPoint.slice(0,3);//获取现有数组中的分段组成新数组
						//trace("_hitPointxx---------------------------------",_hitPointxx)  
						//trace("ny=",ny) 
							break;
						case DOWN:
							ny = y+speed;
							xy = 1;
							_hitPointxx = _hitPoint.slice(4,7);
						//trace("_hitPointxx---------------------------------",_hitPointxx)  
						//trace("ny=",ny)  
							break;
						case LEFT:
							nx = x-speed;
							xy = -1;
							_hitPointxx = _hitPoint.slice(6,-1);
						//trace("_hitPointxx---------------------------------",_hitPointxx)  
						//trace("nx=",nx)
							break;
						case RIGHT:
							nx = x+speed;
							xy = 1;
							_hitPointxx = _hitPoint.slice(2,5);
						//trace("_hitPointxx---------------------------------",_hitPointxx)  
						//trace("nx=",nx)
						break;         //break 结束整个循环！ 
						default:break;
				}    	
				// 如果下一目标点超出屏幕范围，则不能移动
				if (nx > Global.stage.stageWidth-20 || nx < 0+20) return false;
				if (ny > Global.stage.stageHeight -40 || ny < 0) return false;
				//碰撞测试 循环每一个游戏对象
				for each(var obj:gameObject in Global.scene.AllObject)  
				{	
					
					//continue结束本次循环！break 结束整个循环！ 如遇不参与检测对象和自己则结束本次循环
					
					if (obj == this || !obj.hitTest) continue;
					if (obj.hitTestObject(this))
					{
						//如果this的y轴大于obj；this深度在obj上+1
						if( this.y>obj.y ) 
						//容器.setChildIndex(对象A,容器.getChildIndex(对象B));
						{	trace("Global.scene.getChildIndex(obj):int",(Global.scene.getChildIndex(obj)))
							trace("Global.scene.getChildIndex(this):int",(Global.scene.getChildIndex(this)))
							Global.scene.setChildIndex( this,Global.scene.getChildIndex(obj)+1)
							trace("Global.scene.getChildIndex(obj):int",(Global.scene.getChildIndex(obj)))
							trace("Global.scene.getChildIndex(this):int",(Global.scene.getChildIndex(this)))
						}
						//{Global.scene.swapChildren( this,obj)}
						//Global.scene.AllObject.swapChildren(obj, this)
						//循环每一个分段数组目标点
					for each(var p:Array in _hitPointxx)
					{   	
							/*trace("obj",obj)
							hitTestPoint 方法的第三个参数是可选的。其值是 Boolean 类型的，
							因此只有 true 和 false。将 shapeFlag 设置为 true 意味着碰撞检测时判断影片中可见
							的图形，而不是矩形边界。注意，shapeFlag 只在能用在检测点与影片的碰撞中。如果是两
							个影片的碰撞就不能用这个参数了。
							*/
						 if (obj.hitmc.hitTestPoint(nx + p[0], ny + p[1], true)) 
						{	
							if(speed>1)
							{speed=1}
							//trace("speed",speed)
							x=Math.round(x*0.1)*10
							y=Math.round(y*0.1)*10
							return false;	
						} 	
					}
					}
					
					
				} 
			// 检测通过
			return true;
		}
 
		//移动
		protected function move():void
		{		
			//判断能否移动
			if (!nextCanMove) return;
			// 根据不同的方向进行移动
			switch(walkDirection)
			{ 
				case UP:
					y -= speed;
					
					break;
					
				case DOWN:
					 y += speed;
				 
					break;
				case LEFT:
					x -= speed;
				
					break;
						
				case RIGHT:
					x += speed;
				
					break;
				default:break;
			}
		}
		
		//覆盖父类的Do方法
		override public function Do():void   
		{	
			if (_isWalk != 0) 
			{move();
				//trace("_isWalk=",_isWalk)
				super.Do(); //执行父函数
			}
			else
			{	//trace("_isWalk=",_isWalk)
				//让实例对象坐标停在正整数上
				x=Math.round(x*0.1)*10
				y=Math.round(y*0.1)*10
					
			}
		}
 
		//被攻击时减血 虚函数
		override public function Hurt(val:uint):void
		{
		}
		override public function die():void
		{
			//死亡时删除控制器
			trace("actionObject 删除—————————控制器")
			controller2.die();
			
		}
	}
}