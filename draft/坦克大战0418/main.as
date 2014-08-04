package  
{
	import D5Power.Scene.BoxToScene;
	import D5Power.Controller.basicController;
	import D5Power.Controller.btnimg; 
	import D5Power.Controller.MonsterController; 
	//import D5Power.Controller.KeyController; 
	import D5Power.Objects.ActionObject; 
	import D5Power.Objects.Player; 
	import D5Power.Objects.Monster; 
	import D5Power.Objects.Base; 
	import D5Power.Objects.gameObject; 
	import D5Power.Objects.Stone; 
	import D5Power.Objects.Trees; 
	import D5Power.Objects.Item; 
	
	import D5Power.Scene.gameScene;
	import D5Power.Scene.mainMC;
	import D5Power.Scene.D5Scene;
	import D5Power.Scene.OverMc;
	import D5Power.Scene.BtnPause;
	import D5Power.Scene.Usermain;
	
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	
		import flash.text.TextFormat;	
	 import flash.text.TextField;
	//trace("1  感谢天地会9RIA论坛的游戏DEMO http://bbs.9ria.com/哈哈哈哈哈哈")
	
	public class main extends Sprite
	{
		var _User:MovieClip;
		//fps计数器
		var spsshow2:FPSCalculator=new FPSCalculator;
		//spsshow2
		
		var mainmc:MovieClip;
		public static var  ctrl2:btnimg = new btnimg();//Player的控制器
		public static var txt3=new TextField();//创建文本实例
		public function main() 
		{	trace("初始")
			
		
			txt3.textColor=0xFF0000;//设置文本颜色
			txt3.x=400;
			
			addChild(txt3)//加载这个文本
			
			
			
			_User=new Usermain();
			_User.x=200;
			_User.y=100;
			addChild(_User)
				
			//_User.addEventListener("保存成功", saveOK);
				trace("11111111111")
			_User._usermainMC.nextBTN.addEventListener(MouseEvent.CLICK,mouseNext)
			trace("222222222")
			
			
		}
		
		public function mouseNext(event:Event):void 
		{	
		
			_User._usermainMC.nextBTN.removeEventListener(MouseEvent.CLICK,mouseNext)
			
			mainx() ;
			_User.userdie();
		removeChild(_User);	
			
			
			
		}
		
	/*	public function saveOK(event:Event):void 
		{
			var HP:int= _User._userHP;
			//_User.visible = false;
		mainx() ;
		}
	*/
		
		public function mainx() 
		{
		trace("Global3", Global._usernameG)
		trace("1")
		mainmc= new mainMC();
			
			 
			 //mainmc.guankamc.loadTxtName.text= _User._usernameG;
			// 声明菜单
			
		trace("1")
		
		//fps计数器加入舞台
		Global.stage.addChild(spsshow2);
		spsshow2.x=500;
		//mainmc.addEventListener(Event.CLOSE, closeHandler);
		mainmc.addEventListener("关卡1", closeHandler);
		mainmc.addEventListener("关卡2", closeHandler2);
		mainmc.addEventListener("关卡3", closeHandler3);
		mainmc.addEventListener("关卡4", closeHandler4);
		Global.stage.addChild(mainmc);	 
		//D5Scene.addEventListener(Event."添加玩家", inplayer);
		}
		
		public function closeHandler2(event:Event):void  
		{  
			GuanDieListener();
			Global.stage.removeChild(mainmc);
			mapconfig=Global.mp2(mapconfig);
			startmain(); 
		}
		public function closeHandler3(event:Event):void  
		{  
			GuanDieListener();
			Global.stage.removeChild(mainmc);
			mapconfig=Global.mp3(mapconfig);
			startmain(); 
			
			 
		}
		public function closeHandler4(event:Event):void  
		{
			GuanDieListener();
			Global.stage.removeChild(mainmc);
			mapconfig=Global.mp4(mapconfig);
			startmain(); 
		}
 
		 function GuanDieListener()
		{
			mainmc.removeEventListener("关卡1", closeHandler);
			mainmc.removeEventListener("关卡2", closeHandler2);
			mainmc.removeEventListener("关卡3", closeHandler3);
			mainmc.removeEventListener("关卡4", closeHandler4);
		
		}
		
		public var mapconfig : Array;
		private function closeHandler(event:Event):void  
		{  
			
			trace("开始游戏！！！！！");  
			
			GuanDieListener();
			Global.stage.removeChild(mainmc);
			mapconfig=Global.mp1(mapconfig);
			startmain(); 
				 
			trace("数组声明完成");
		}  
		
		
		//玩家的控制器静态变量
		var scene:D5Scene = new D5Scene(stage);  // 声明游戏舞台
		var timer:Timer = new Timer(15000);
		var btnPause:MovieClip;
		
		public function startmain() 
		{	
			trace("Global4", Global._usernameG)
			scene.setup(mapconfig);
			Global.scene.addlistenerFrame( );
			 
			//定义了一个时间间隔是30秒的定时器，每次都会运行createItem方法来创建道具30000=30秒
			timer.addEventListener(TimerEvent.TIMER, createItem22);
			timer.start();
			// 声明游戏舞台
			
		 	Global.stage.addChild(scene);
			main.ctrl2.inaddEventListener();
			ctrl2.x=0;
			ctrl2.y=640;
			Global.stage.addChild(ctrl2);
			//Global.stage.addChild(ctrl2);
			Global.stage.addChildAt(scene,Global.stage.numChildren-2)
			btnPause = new BtnPause();
			btnPause.x=920;
			btnPause.y=20;
			Global.stage.addChild(btnPause);
			
		
			//base.part = 1;   //基地的阵营和主角的是一致的
			//var obj:Player = new Player(ctrl2,new Skin1());	// 定义可活动的游戏对象/function 函数名(参数：数据类型＝默认值)：数据类型
			
			Global.stage.addEventListener("PlayerOver", playOver);
			trace("22 初始完成")
		}
		//添加box至地图
		private function createItem22(e:TimerEvent):void
		{
			var box:BoxToScene = new BoxToScene(); 
		}

		//本关结束的弹出面板
		var overmc:MovieClip= new OverMc();
		public function playOver(event:Event):void
		{ 	//调用键控的die方法，删除键控界面
			main.ctrl2.die();
			trace("玩家挂掉了 侦听")
			Global.stage.removeEventListener("PlayerOver", playOver);
			overmc.x=200;
			overmc.y=100;
			Global.stage.addChild(overmc);
			trace("添加 关闭面板");
			//没搞懂 overmc为什么移不到顶层 所以只好反过来把scene移下层
			//Global.stage.addChildAt(scene,Global.stage.numChildren-3)
			Global.stage.addChildAt(overmc,Global.stage.numChildren-1)
			trace("添加游戏关闭的侦听");
			overmc.addEventListener("GameOver", GameOverDo);
			overmc.addEventListener("GameAgain", GameAgainDo);
			//帧频参数设置！ 帧数渲染时间
			//Global.stage.frameRate = 48;
			trace("————————");
		}
		 

		
		public function SceneDie():void
		{	
			trace("开始删除场景对象______________")
			
			//main.ctrl2=null;
			//删除前先暂停容器帧频率
			//删除对象层次深度前先删除渲染Frame侦听
			Global.scene.dielistenerFrame( );

			for(var i:int=Global.scene.numChildren-1; i>=0; i--) 
			{ 				
				//trace("Global.stage",Global.stage) 
				//trace("Global.stage.scene",scene) 
				trace("i",i)
				trace("删除Global.scene.getChildAt(0)",Global.scene.getChildAt(0))
				//调用子对象内部删除方法
				var timpObject= Global.scene.getChildAt(0);
				if(Global.scene.contains(timpObject))
				{
					Global.scene.removeObject(timpObject);
			
					trace ("有 0 对象删除")
				}
				else{"无0 对象跳过"  }
			
				
			}
			timer.removeEventListener(TimerEvent.TIMER, createItem22);
			//删除完所有对象之后恢复帧频率 24
			Global.stage.frameRate = 24;
		}
		
		public function GameAgainDo(event:Event):void
		{
			//删除侦听
			trace("重新开始____________")
			//timer.removeEventListener(TimerEvent.TIMER, createItem22);
			overmc.removeEventListener("GameOver", GameOverDo);
			overmc.removeEventListener("GameAgain", GameAgainDo);
			SceneDie();
			startmain();
			Global.stage.removeChild(overmc);
		}
		public function GameOverDo(event:Event):void
		{
			SceneDie();
			Global.stage.removeChild(overmc);
			mainx();
			
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
	
}