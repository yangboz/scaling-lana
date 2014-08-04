package D5Power.Objects
{		
			import flash.events.Event;
        import D5Power.Controller.basicController;
    	import flash.display.MovieClip;
        import flash.display.Sprite;
	import flash.geom.ColorTransform; //颜色类
		//import D5Power.Objects.imgBaseHit;
        public class Base extends gameObject
        {
				public var Basehitmc:imgBaseHit = new imgBaseHit;
				protected var _hp:uint ;
				protected var magicShow:MovieClip = new MagicShow();
			//HP低于20   要变的颜色变量
			var trans:ColorTransform=new ColorTransform();
                public function Base( face:MovieClip)
                {
					super();
					addChild(face);
					//能被碰撞
					_hitTest = true;
					trace("xxx-------------------------------------------")
				//	trace("Basehitmc",Basehitmc)
				//	trace("hitmc",hitmc)
					//hitmc= Basehitmc as hitMC;
			//		trace(" Basehitmc as hitMC", Basehitmc as hitMC)
			//		trace("hitmc",hitmc)
					trace("xxx2-------------------------------------------")
					_hp= 30;
					addChild(magicShow);
					magicShow.bar.scaleX = _hp;
					magicShow.x=-5;
					magicShow.y=-10;
					//magicShow.bar.y=65;
					hitmc.x = 0;
					hitmc.y = 0;
					trace("xxx3-------------------------------------------")
					addChild(hitmc); 
					
					
					
                }
				public function get HP():uint
			{
				return _hp;
			}
			
			
				override public function Hurt(val:uint):void
				{
					
					_hp -= val;
					magicShow.bar.scaleX = _hp;
					if(_hp<=0)
					{
						trace("Global.base",Global.base);
						Global.scene.removeObject(this);
						Global.stage.dispatchEvent(new Event("PlayerOver"));
						
						trace("Global.base",Global.base);
						trace("基地被摧毁");
					}
					else if(_hp <=20)
					{
						trans.color = 0xff0000;
						magicShow.bar.transform.colorTransform=trans; 
					}
				
					//super.Hurt(val);
			/*if(_hp<=0)
			{
				Global.base=null;
				trace('基地被摧毁！');
				
				//发送挂掉的信息
				
			}
					*/
				}
				override public function die():void
			{	
				//removeChild(_face);
				Global.scene.removeObject(this);
									//基地是全局常量变量
						Global.base=null;
				trace("基地删除————————")
			}
				
        }

}