package D5Power.Objects 
{		
		import flash.display.MovieClip;
        import flash.display.Sprite;
        import D5Power.Controller.basicController;
		import D5Power.Objects.ActionObject;
	
		//import D5Power.Controller.KeyController;
		import D5Power.Controller.MonsterController;
	
		import D5Power.MyInterface.IShoot;
        /**
         * 敌人类
         * @author D5Power
         */
        public class Monster extends FaceObject implements IShoot
        {
                //上一次的运行日期对象
                private var _lastAction:Date;
                //运行频率
                private var _fps:uint = 24;
				

			
				//控制器
				
				
                public function Monster(ctrl2:basicController,face:MovieClip) 
                {
					//trace(" super(ctrl3,face);")
					//speed= 2;
                        super(ctrl2,face);
                        _lastAction = new Date();
						_hp= 40;
						magicShow.bar.scaleX = _hp;
						magicShow.hpdi.scaleX = _hp;
						//trace("_hp=======================",_hp)
						hitmc.x = -20;
						hitmc.y = 0;
						addChild(hitmc);
                }
				//自动移动
                override public function Do():void
                {
                        var date:Date = new Date();
                        // 如果运行时间已经超过频率所指定的时间间隔，那么运行程序
                        if (date.time-_lastAction.time > 100/_fps)
                        {
                                _lastAction = date;
                                controller2.AutoRun();
                                super.Do();
                        }
                }
				//射击子弹
				override public function Shoot():void
                {
                        var b:BulletObject = new Bullet1(this,new MCBullet_1());
                        b.x = x;
                        b.y = y+20;
                        Global.scene.addObject(b);
                }
        }
}