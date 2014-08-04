package D5Power.Scene 
{
	import D5Power.Objects.gameObject;
	import flash.display.Stage;
	import D5Power.Objects.Base;  
	import D5Power.Objects.Trees; 
	import D5Power.Objects.Stone;
	import D5Power.Objects.Fix;
	
	import D5Power.Objects.Monster;
	import D5Power.Objects.Player;
	
	import D5Power.Controller.basicController;
	import D5Power.Controller.MonsterController;
	import D5Power.Controller.btnimg; 
	
	public class D5Scene extends gameScene
	{
		//地图数据
		protected var _mapData:Array;
		
		
		
		public function D5Scene(_stage:Stage) 
		{
			super(_stage);
		//	trace("ctrl2============================",ctrl2)
			
		}
		
		
		
		
		//配置地图解析方法，对_mapData进行循环解析，把其中的数字转换成可以通过的位置，障碍物，敌人，或我们自己的角色。
		public function setup(arr:Array):void//setup传递入一个参数arr
                {		
                        _mapData = arr;  
						//arr为一个2维数组 结构arr[y][x] 
                        if (arr[0] == null || arr[0][0]==null) return; 
						//数组格式判断if (arr[0] == null || arr[0][0]==null) return;
                        var y:uint = 0;
                        var x:uint;
                        //对数组中的全部数据进行了循环解析。如果发现data不为0，也就是不可通过的位置，则进行相关的处理。
                       var obj:gameObject;
						//trace("obj",obj)
						for each(var line:Array in arr)
                        {
                                x = 0;
                                for each(var data:uint in line)
                                {
                                        if (data != 0)
                                        {		
											obj = getObjById(data);
											if (obj != null)
											{
												//trace("addObject(obj),obj",obj) 添加对象
												//trace("data",data) 判断对象是什么是否需要坐标修正
												addObject(obj);
												if(data<=2)
												{
													obj.x = 40 * x+20;
													obj.y = 40 * y; 
													//trace( "obj.x",obj.x)
												}
												else{obj.x = 40 * x;
												obj.y = 40 * y;
												}
											}
                                        }
										else { 
											//trace("空")
											}
										
										
										
										
										
										
                                        x++;
                                }
                                y++;
                        }
							//addChild(ctrl2);
                }
				/*
				通过数字ID获取对应的数字元素
                地图数字
                 */
                protected function getObjById(id:uint):gameObject
                {	//var ctrl22:btnimg =ctrl2;
                        var result:gameObject;
                        switch(id)
                        {
                                
							
								case 1:
										trace("添加玩家")
										//注意如果传的参数是class就需要new……()后缀！示例：new Trees(new basicController(), new IMtree());  new用于新的实例化，()用于执行空间中的函数
										//但如果传的参数是实例 就只需要实例名就可以！示例：new Player(ctrl2,new Skin1());  调用实例名时会直接执行函数
										//在库链接里面的对象可以直接使用的，但注意new出来的是Class空间而不是实例Object
										//result = new Player(ctrl2,new Skin1());
										result = new Player(main.ctrl2,new Skin1());
										//trace("btnimg================",btnimg)	
										//result = new Player(new btnimg(),new Skin1());
								/*var  ctrl2xx:btnimg= new btnimg()
								ctrl2xx.y=200
								addChild(ctrl2xx);*/
										result.part = 1;
										//trace("result.x",result.x)
										break;

                                case 2:
										result = new Monster(new MonsterController(), new Skin3());
										result.part = 2;
                                        break;
                                case 3:
									trace("添加树")
										result = new Trees(new IMtree());
										 result.part = 3;
										 break;

								case 4:
									trace("添加石头")
                                        result =new Stone(new IMGstone());
								//trace("IMGstone",IMGstone)
                                        result.part = 3;
                                        break;
								
								
									case 9:
									trace("添加维修站")
                                        result =new Fix (new IMGFix ());
								//trace("IMGstone",IMGFix)
                                        result.part = 1;
                                        break;
								
								
								
								case 11:
										 trace("添加基地")
										result = new Base(new Skin_base());
								trace("Skin_base",Skin_base)
										result.part = 1;
					/*			case 12:
										 trace("显示控制器")
								trace("ctrl2",ctrl2)
										result = ctrl2  as gameObject;
								trace("ctrl2",result )
										result.part = 4;
					*/			
								
                                       // result = new Player(new btnimg(), new Skin1());
										//trace("result = new Player(new btnimg(), new Skin1());",btnimg)
                                       // result.part = 3;
										//dispatchEvent(new Event(Event."添加玩家"));  
										//btnimg.x=0;
										//btnimg.y=390;
										//trace("ctrl2",btnimg)
										//addChild(btnimg);
                                        break;
                        }
                        return result;
                }

	}
	
}