package D5Power.Scene
{
	import D5Power.Objects.Monster;
	import D5Power.Objects.ActionObject;	//安装D5Power.Objects.ActionObject
	import D5Power.Objects.gameObject;		//安装D5Power.Objects.gameObject
    
	import D5Power.Scene.D5Scene;
	import D5Power.Scene.gameScene;
	//import flash.events.KeyboardEvent;
	import D5Power.Objects.Item; 
	import flash.display.MovieClip;
	import flash.geom.Point;
	//键盘控制器
	 
	public class BoxToScene //extends basicController
	{	
			//定义了一个时间间隔是30秒的定时器，每次都会运行createItem方法来创建道具30000=30秒
			//var timer:Timer = new Timer(3000);
	
		public function BoxToScene() 
		{
			//timer.addEventListener(TimerEvent.TIMER, createItem);
			//timer.start();
			trace("BOXBOXBOXBOXBOXBOXBOX~~~~~~~~~~~~~")
			 createItem();
		}
		 //main主类从这里调取tiem 道具
		private function createItem():void
                {
                        for each(var obj:gameObject in Global.scene.AllObject)
                        {
                                if (obj is Item) Global.scene.removeObject(obj);
                        }
                      
                        var p:Point = getRandomPlace();
                        var item:Item = new Item(new item_upspeed());
						trace("p.x",p.x);
						trace("p.y",p.y);
                        item.x = 40 * p.x;
                        item.y = 40 * p.y;
                        Global.scene.addObject(item);
                }
				//  查找一个空的位置
                  
                private function getRandomPlace():Point
                {		//声明两个空变量 填入mapconfig的随机数组
                        var ry:uint = int(Math.random() * Global.map1.length);
                        var rx:uint = int(Math.random() * Global.map1[0].length);
						trace("mapconfig[ry]",Global.map1[ry])
						trace("mapconfig[rx]",Global.map1[rx])
                        if (Global.map1[ry][rx] == 0) return new Point(rx, ry);
						trace("mapconfig[ry][rx]",Global.map1[ry][rx] )
                        return getRandomPlace();
                }
		 
		
	}
}