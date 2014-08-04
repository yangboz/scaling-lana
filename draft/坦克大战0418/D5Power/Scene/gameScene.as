package D5Power.Scene 
{
	import D5Power.Objects.gameObject;
	import D5Power.Objects.Monster;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import D5Power.Controller.btnimg; 
	//基本游戏场景
	public class gameScene extends Sprite
	{
		//舞台中的对象列表
		//var ctrl2:btnimg= new btnimg();//Player的控制器
		
		protected var monsterlist:int;
		protected var objectList:Array;
		/**
		 * 创建游戏基本场景需要传递基本舞台这个参数
		 *  	_stage	舞台
		 */
		public function gameScene(_stage:Stage) 
		{	
			trace("2 ");
			Global.stage = _stage;
			Global.scene = this;
			trace("Global.scene",Global.scene)
			objectList = new Array();
			trace("objectList",objectList)
			Global.stage.addEventListener(Event.ENTER_FRAME, render);
			trace("6");
		}
		public function addlistenerFrame()
		{Global.stage.addEventListener(Event.ENTER_FRAME, render);}
		public function dielistenerFrame()
		{Global.stage.removeEventListener(Event.ENTER_FRAME, render);}
		/**
		 * 向游戏世界中增加新的游戏对象
		 * obj
		 */
		public function addObject(obj:gameObject):void
		{
			//判断加载类是否是Monster！以确定数量
			if(obj is Monster)
			{  
				monsterlist++;
				trace("monsterlist__________________________",monsterlist)
			}
		
			if (objectList.indexOf(obj) != -1) return; // 不重复添加
			//trace("gameScene obj 19",obj)
			objectList.push(obj);     //对象添加到游戏对象列表
			//trace("gameScene objectList",objectList)
			//trace("objectList",objectList)
			addChild(obj);
			///trace("20")
		}
		
		/**
		 * 从游戏世界中删除游戏对象
		 * obj 其它类中当有游戏对象需要删除时直接调用这句 删除针对的游戏对象 
		 */
		public function removeObject(obj:gameObject):void
		{
			/*示例
				if (item.name.indexOf("Flash 5")!=-1) {
				trace("第"+(index+1)+"这本过时了");
                return false;
				} //注：将所有元素从左查到右，如果找到"Flash 5"这个串,就trace这本书过时了
			*/
			//indexOf 这个关键字 用在两个地方 一个数组(Array.indexOf),另一个字符串(String.indexOf)
			//判断obj在objectList中的位置
			trace("ganeScene删除3",objectList)
			trace("ganeScene删除0",obj)
			trace("ganeScene删除1",objectList.indexOf(obj))
			var id:int = objectList.indexOf(obj);
			trace("ganeScene删除2    id ", id)
			if (id == -1) return;
			trace("ganeScene删除3",objectList)
			//splice删除  objectList中 (第一个参数id是索引起始位置 要考虑0，第二个参数代表删除的数量)
			//示例；oceans.splice(2, 2, "Arctic", "Atlantic"); // 删除索引二的位置,删除2个, 替换 Aral 和 Superior
			objectList.splice(id,1);
			trace("ganeScene删除4",obj)
			removeChild(obj);
			trace("ganeScene删除5",obj)
			obj.die();
			if(obj is Monster)
			{  monsterlist--;
				trace("monsterlist__________________________",monsterlist);
				if(monsterlist==0)
				{Global.stage.dispatchEvent(new Event("PlayerOver"));  }
			}
		}
		
		/*
		 * 其它类中需要获得游戏对象列表时 调用
		 如发送给ActionObject用于检测碰撞
		 */  
		public function get AllObject():Array
		{
			return objectList;
		}
		
		/**
		 * 渲染函数，通过本函数逐个计算游戏中各对象的动作
		 */
		public function render(e:Event):void
		{
			//trace("渲染")
			for each(var obj:gameObject in objectList) obj.Do();
			//通过objectlist列表对游戏对象的Y轴进行排序
			/*
			objectList.sortOn("y", Array.NUMERIC);
			var i:int = objectList.length;
			while(i--)
			{
				if (getChildAt(i) != objectList[i]) 
				{
				setChildIndex(objectList[i], i);
				}
			}
			*/
		}
	}
}