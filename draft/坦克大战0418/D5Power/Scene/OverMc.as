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
	public class OverMc extends MovieClip
	{
		trace("3");
		trace("3a");
		var _overmc:MovieClip=new OVERMC();
		
		public function OverMc() 
		{
		addChild(_overmc);
		this._overmc.BtnAgain.addEventListener(MouseEvent.MOUSE_DOWN, BtnAgainDo); 
		this._overmc.BtnOver.addEventListener(MouseEvent.MOUSE_DOWN, BtnOverDo);  
		trace("3b")
		}
		
		private function BtnAgainDo(event:MouseEvent):void  
		{
			//Global.stage.frameRate = 0;
			trace("再来一次GameAgain1")
			dispatchEvent(new Event("GameAgain"));  	
			trace("再来一次GameAgain2")
			//this._overmc.BtnAgain.removeEventListener(MouseEvent.MOUSE_DOWN, BtnAgainDo);  
			//this._overmc.BtnOver.removeEventListener(MouseEvent.MOUSE_DOWN, BtnOverDo);  
			//发送事件  (Event.CLOSE) 可自定义 写成("去你妈的")   这样在main
			//dispatchEvent(new Event(Event.CLOSE));  			
		}

		private function BtnOverDo(event:MouseEvent):void  
		{
			//Global.stage.frameRate = 0;
			trace("游戏结束GameOver ")
			dispatchEvent(new Event("GameOver"));  
			//this._overmc.BtnAgain.removeEventListener(MouseEvent.MOUSE_DOWN, BtnAgainDo);  
			//this._overmc.BtnOver.removeEventListener(MouseEvent.MOUSE_DOWN, BtnOverDo);  
			//发送事件  (Event.CLOSE) 可自定义 写成("去你妈的")   这样在main
			//dispatchEvent(new Event(Event.CLOSE));  
		}
		//this.addEventListener(MouseEvent.MOUSE_DOWN, clickHnadler);  
	}
}