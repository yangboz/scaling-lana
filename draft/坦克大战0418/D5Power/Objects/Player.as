package D5Power.Objects 
{
		import flash.events.Event;
        import flash.display.Sprite;
      	import flash.display.MovieClip;
		import D5Power.Controller.basicController
		//import D5Power.Controller.KeyController;
		import D5Power.Controller.btnimg;
		import D5Power.MyInterface.IShoot;
        //主角类
        public class Player extends FaceObject implements IShoot
        {
				//子弹类型状态 暂时只能有一种
				var bulletFrom:int=1;
				trace("安装player")
                public function Player(ctrl2:basicController,face:MovieClip) 
                {
					super(ctrl2,face);
					speedObject=4;
					_face.stop();
					_hp= Global._userHP;
					magicShow.bar.scaleX = _hp;
					magicShow.hpdi.scaleX = _hp;
					//trace("_hp=======================",_hp)
					hitmc.x = -20;
					hitmc.y = 0;
					this.addChild(hitmc); 
                }
				
				
				override public function Shoot():void
				{
					trace("射击——————————————————————————>")
					//var boom:BoomEffect = new BoomEffect(new boom01());
					//var  _bulletface=new MCBullet_1();  
					//var b:BulletObject = new BulletObject(this,_bulletface);
					var b:BulletObject = new Bullet2(this,new MCBullet_2());
					//b子弹初始坐标=发射者坐标
					
					trace(" x=", x );
					trace(" y=", y );
					
					
					b.x = x;
					b.y = y+20;
					
					Global.scene.addObject(b);
					trace("子弹添加到场景")
				}
                
				override public function mcUp():void
				{_face.gotoAndStop("moveup");}
				
				override public function mcMove():void
				{
					_face.gotoAndStop("moveing");}
				
				override public function mcDown():void
				{_face.gotoAndStop("movedwon");}
							// 获取HP
				
			//这个方法返回值  返回当前类的设定的默认血量
			override  public function get HP():uint
			{
				return _hp;
			}
				
				
				
	 
			//var timpV:Boolean=false;
			override public function die():void
			{
				//Global.scene.removeObject(this);
				trace("face 删除————————xxxxxxxxxxxxxxxxxxxxxxxplay")
				//死亡时删除控制器
				
				
				//trace("为了避免两次die 导致的报错 可能是gameScene导致的 到现在还搞不清楚",timpV);
				//if(timpV==true) return;
				
				trace("死亡时删除控制器")
				//main.ctrl2.die();
				//发送挂掉的信息
				Global.stage.dispatchEvent(new Event("PlayerOver"));  
				trace("发送挂掉的信息")
				//main.guanOver();
				//main.ctrl2=null;
				//timpV=true;
			}
	}

}