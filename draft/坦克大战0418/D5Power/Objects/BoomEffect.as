package D5Power.Objects 
{
        import flash.display.MovieClip;
        import flash.events.Event;
        /**
         * 爆炸效果
         *  
         */
        public class BoomEffect extends gameObject
        {
                protected var _face:MovieClip;
                /**
                 * 
                 *       face        效果MC
                 */
                public function BoomEffect(face:MovieClip) 
                {
                        _face = face;
						//这个没有碰撞检测不用添加到scene 中
                        addChild(_face);
                        _face.addEventListener(Event.COMPLETE, onComplate);
                }
                
                /**
                 * 侦听到动画的播放结束事件
                 *      e
                 */
                private function onComplate(e:Event):void
                {
                        Global.scene.removeObject(this);
                        
                }
                
                override public function die():void
                {
					trace("删除爆炸1")
                        removeChild(_face);
					trace("删除爆炸2")
                        _face = null;
					trace("删除爆炸3")
                }
                
        }

}