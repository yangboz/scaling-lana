package D5Power.Objects 
{
        import flash.display.MovieClip;
        //加速道具
        public class Item extends gameObject 
        {
                protected var _face:MovieClip
                // face        皮肤MC
                public function Item(face:MovieClip) 
                {
                        _face = face;
                        _hitTest = false; // 不参与子弹碰撞
                        addChild(_face);
                }
                
                //加速方法
                override public function Do():void
                {
                        // 检查是否发生碰撞
                        for each(var obj:gameObject in Global.scene.AllObject)
                        {		
                                //if (obj is Player || obj is Monster)
								//让判断只对玩家有效
								if (obj is Player)
                                {
                                        if (hitTestObject(obj))
                                        {
											var speedtimp:uint
												//增加现有速度
                                                //从碰撞实例获得现有速度
                                               speedtimp=(obj as ActionObject).Speedget;
												//给碰撞实例的现有速度+1
												(obj as ActionObject).Speedset=(speedtimp+1);
												//删除自己
												Global.scene.removeObject(this);
												 
                                                break;
                                        }
                                }
                        }
                }
                                
                override public function die():void
                {	
                    // removeChild(_face);
					Global.scene.removeObject(this);
					_face = null;
                }   
        }
}