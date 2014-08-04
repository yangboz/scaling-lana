package D5Power.Controller {
	import D5Power.Objects.Player;
	import D5Power.Objects.Monster;
	import D5Power.Objects.gameObject;
	import D5Power.Objects.FaceObject;
	import D5Power.Objects.ActionObject; 
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	//安装移动触摸类
	import flash.events.TouchEvent; 
	import flash.ui.Multitouch; 
	import flash.ui.MultitouchInputMode;
	
	public class btnimg extends  basicController  {
		//这句声明表明输入模式为触屏而非鼠标事件，没有这句声明是不能启动TouchEvent的 
		 Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			var faceBtn:MovieClip;
		
		public function btnimg() {
			// constructor code
			trace("inter btnimg")
			super();
			faceBtn=new facebtn();
			
			
		}
	
		//覆盖父类的控制对象 控制对象是object Player
		override public function set target(obj:gameObject):void
		{
			_target = obj;
			
			trace("_target~~~~~~~~~~~~~~~~~~~~~~~",_target)//输出 [object Player]
			this.addChild(faceBtn); 
			 //安装侦听器！
		}	
		
		public function inaddEventListener()
		{			//添加按钮侦听！
			trace("me",_target) //输出null
		this.faceBtn.imgUp.addEventListener(MouseEvent.MOUSE_OVER,doImgUp);
		this.faceBtn.imgUp.addEventListener(MouseEvent.MOUSE_DOWN,doImgUp);
		this.faceBtn.imgDown.addEventListener(MouseEvent.MOUSE_OVER,doImgDown);
		this.faceBtn.imgDown.addEventListener(MouseEvent.MOUSE_DOWN,doImgDown);
		this.faceBtn.imgLeft.addEventListener(MouseEvent.MOUSE_OVER,doImgLeft);
		this.faceBtn.imgLeft.addEventListener(MouseEvent.MOUSE_DOWN,doImgLeft);
		this.faceBtn.imgRight.addEventListener(MouseEvent.MOUSE_OVER,doImgRight);
		this.faceBtn.imgRight.addEventListener(MouseEvent.MOUSE_DOWN,doImgRight);
			
		//this.faceBtn.imgfire.addEventListener(MouseEvent.MOUSE_OVER,openFireImg);
		//这个demo启用可能会导致按键长按！原因还没查明
		this.faceBtn.imgfire.addEventListener(MouseEvent.MOUSE_DOWN,openFireImg);
 	
		this.faceBtn.imgfire.addEventListener(TouchEvent.TOUCH_TAP,openFireImg);  //触摸
		//imgfire.addEventListener(TouchEvent.TOUCH_ROLL_OVER,openfireImg);   //弹起 
			
			this.faceBtn.addEventListener(MouseEvent.MOUSE_OUT,doMouseUp);
			this.faceBtn.addEventListener(MouseEvent.MOUSE_UP,doMouseUp);
		}
		
		
		override public function die():void
		{	
			trace("btnimg_die_play控制器删除")
		this.faceBtn.imgUp.removeEventListener(MouseEvent.MOUSE_OVER,doImgUp);
		this.faceBtn.imgUp.removeEventListener(MouseEvent.MOUSE_DOWN,doImgUp);
		this.faceBtn.imgDown.removeEventListener(MouseEvent.MOUSE_OVER,doImgDown);
		this.faceBtn.imgDown.removeEventListener(MouseEvent.MOUSE_DOWN,doImgDown);
		this.faceBtn.imgLeft.removeEventListener(MouseEvent.MOUSE_OVER,doImgLeft);
		this.faceBtn.imgLeft.removeEventListener(MouseEvent.MOUSE_DOWN,doImgLeft);
		this.faceBtn.imgRight.removeEventListener(MouseEvent.MOUSE_OVER,doImgRight);
		this.faceBtn.imgRight.removeEventListener(MouseEvent.MOUSE_DOWN,doImgRight);
			
		//this.faceBtn.imgfire.removeEventListener(MouseEvent.MOUSE_OVER,openFireImg);
		this.faceBtn.imgfire.removeEventListener(MouseEvent.MOUSE_DOWN,openFireImg);
 	
		this.faceBtn.imgfire.removeEventListener(TouchEvent.TOUCH_TAP,openFireImg);  //触摸
		//imgfire.addEventListener(TouchEvent.TOUCH_ROLL_OVER,openfireImg);   //弹起 
			
			this.faceBtn.removeEventListener(MouseEvent.MOUSE_OUT,doMouseUp);
			this.faceBtn.removeEventListener(MouseEvent.MOUSE_UP,doMouseUp); 
			this.removeChild(faceBtn); 
		}
	
		
		
		
		// 按钮下是
		
		
		public function doImgUp(event:MouseEvent):void
		{	 
			//var me:ActionObject =_target as ActionObject;//生命 me:ActionObject
			 
		 
			var me:Player =_target as Player;
		 
			trace("player  tuch to up ")
			//在play类实例化的对象ME中 set设置direction = 1   在ActionObject类声明的UP定义中值为1
			me.direction = ActionObject.UP; //给me.direction赋值
			me.isWalk = true;//isWalk设置为true
			trace("isWalk",main.txt3.text = String(me.isWalk=true))
		}
		protected function doImgDown(event:MouseEvent):void
		{
			var me:Player =_target as Player;
		 
			me.direction = ActionObject.DOWN;
			trace("player  tuch to dome ")
			me.isWalk = true;//isWalk设置为true
			trace("isWalk",main.txt3.text = String(me.isWalk=true))
		}
		
		protected function doImgLeft(event:MouseEvent):void
		{	
			var me:ActionObject =_target as Player;
			me.direction = ActionObject.LEFT;
			trace("player  tuch to left ")
			me.isWalk = true;//isWalk设置为true
			trace("isWalk",main.txt3.text = String(me.isWalk=true))
		}
		protected function doImgRight(event:MouseEvent):void
		{
			var me:ActionObject =_target as ActionObject;
			 
			me.direction = ActionObject.RIGHT;
			trace("player  tuch to right ")
			me.isWalk = true;//isWalk设置为true
			trace("isWalk",main.txt3.text = String(me.isWalk=true))
		}
		
		
		protected function doMouseUp(event:MouseEvent):void
		{	
			var me:Player = _target as Player;
			 
			
			me.isWalk = false; //恢复isWalk为false
			trace("isWalk",main.txt3.text = String(me.isWalk=false))
		}
		protected function openFireImg(event):void
		{	
			//var me:FaceObject = _target as FaceObject;
			//var me:Monster = _target as Monster;
			//trace("_target as Monster",Monster)
			trace("_target", _target)
 
			var me:Player= _target as Player;
			trace("_target as Player", _target as Player)
			trace("开火———————————————")
			//var me:Player = _target as Player;
			trace("me",me)
			me.Shoot();
			trace("开火————————————————————")
			//var bulletController:BulletController = _target as BulletController;
			//bulletController.BulletGo();
		}
		
		
		 
		
	}
	
}
