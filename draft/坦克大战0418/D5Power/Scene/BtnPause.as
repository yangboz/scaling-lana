package D5Power.Scene
{
	import flash.events.Event; 
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	/**
	 * 基本游戏 
	 *  D5.Howard
	 */
	public class BtnPause extends MovieClip
	{
 
		var _imgpause:MovieClip=new BTNPause();
		
		public function BtnPause() 
		{
			addChild(_imgpause);
		this._imgpause.addEventListener(MouseEvent.MOUSE_DOWN, PauseDo); 
			
		 
		trace("3b")
		}
		
		private function PauseDo(event:MouseEvent):void  
		{
			//暂停舞台
			Global.stage.frameRate = 0;
			trace("再来一次GamePuase1")
			//Global.stage.addEventListener("PlayerOver", playOver);
			Global.stage.dispatchEvent(new Event("PlayerOver"));  	
			trace("再来一次GamePuase")
			this._imgpause.removeEventListener(MouseEvent.MOUSE_DOWN, PauseDo); 
			//removeChild(_imgpause);
		 //this._overmc.BtnOver.removeEventListener(MouseEvent.MOUSE_DOWN, BtnOverDo);  
			//发送事件  (Event.CLOSE) 可自定义 写成("去你妈的")   这样在main
			//dispatchEvent(new Event(Event.CLOSE));  
			
		}
 
	
		

	}
	
}