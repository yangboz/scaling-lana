package D5Power.Objects 
{
        import flash.display.Sprite;
      	import flash.display.MovieClip;
		import D5Power.Controller.basicController;
		//import D5Power.Controller.KeyController;
		import D5Power.Controller.btnimg;
		import flash.geom.ColorTransform; //颜色类
		//import flash.geom.Matrix;
        //具备外表皮肤的ActionObject
        public class FaceObject extends ActionObject
        {
			//注意_face实例需为MC才可控制播放
			protected var _face:MovieClip;
			protected var _hp:uint ;
			//血条
			protected var magicShow:MovieClip = new MagicShow();
			//HP低于20   要变的颜色变量
			var trans:ColorTransform=new ColorTransform();
			
			//ctrl     控制器	 face      外观 
			public function FaceObject(ctrl2:basicController,face:MovieClip) 
			{		
				//trace("super(ctrl2);");
				super(ctrl2);
				_face = face;
				addChild(_face);
				
				addChild(magicShow);
				magicShow.x=-25;
				magicShow.y=-20;
				magicShow.bar.scaleX = _hp;
				//trace("_hp=======================",_hp)
			}
			
			// 获取HP
			 public function get HP():uint
			{
				return _hp;
			}
		
			override public function Hurt(val:uint):void
			{
				_hp -= val;
				magicShow.bar.scaleX = _hp;
				if (_hp <= 0) 
				{
					//Global.scene.addObject(boom);
					Global.scene.removeObject(this);
					}
				else if(_hp <=20)
				{
					//低于20变红
					trans.color = 0xff0000;
					magicShow.bar.transform.colorTransform=trans; 
				}
			}
			
			//射击虚函数
			public function Shoot():void
			{
			}
			/*override public function die():void
			{
				Global.scene.removeObject(this);
				trace("faceObject 删除————————face")
			}
			*/
			override public function set direction(dir:uint):void
			{
				super.direction = dir;
				switch(dir)
				{
					case ActionObject.UP:
					mcUp();
					break;
					
					case ActionObject.RIGHT:
					mcMove();
					magicShow.scaleX=-1;
					magicShow.x=25;
					this.scaleX=-1;
					break;
					
					case ActionObject.DOWN:
					mcDown()
					break;
					
					case ActionObject.LEFT:
					mcMove();
					magicShow.scaleX=1;
					magicShow.x=-25;
					this.scaleX= 1;
					break;
				}
			}	
			
			//播放子类的mc动画空函数
			public function mcUp():void
			{}
			public function mcMove():void
			{}
			public function mcDown():void
			{}
 
        }
}