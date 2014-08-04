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
	public class mainMC extends MovieClip
	{
		trace("3")
		var guankamc:MovieClip=new MainMC();
		trace("3x")
		
		
		
		public function mainMC() 
		{
		addChild(guankamc);
			
			trace("Global",Global)
			//trace("Global", Global._usernameG)
			
		 guankamc.loadTxtName.text = Global._usernameG;
			
		this.guankamc.startbtn.addEventListener(MouseEvent.MOUSE_DOWN, clickHnadler);  
		//this.guankamc.startbtn.addEventListener(MouseEvent.MOUSE_OVER, clickHnadler);  
		
		this.guankamc.startbtn2.addEventListener(MouseEvent.MOUSE_DOWN, clickHnadler2);  
		this.guankamc.startbtn3.addEventListener(MouseEvent.MOUSE_DOWN, clickHnadler3);  
		this.guankamc.startbtn4.addEventListener(MouseEvent.MOUSE_DOWN, clickHnadler4);  
		//this.guankamc.startbtn2.addEventListener(MouseEvent.MOUSE_OVER, clickHnadler2);  
		//this.guankamc.startbtn3.addEventListener(MouseEvent.MOUSE_OVER, clickHnadler3);  
		//this.guankamc.startbtn4.addEventListener(MouseEvent.MOUSE_OVER, clickHnadler4);  
	 
		trace("3")
		}
		
		private function mainsetname(xxx:String):void  
		{guankamc.loadTxtName.text=  xxx;}
		
		
		private function clickHnadler(event:MouseEvent):void  
		{
			trace("aaaa")
			DieListener();
			//发送事件  (Event.CLOSE) 可自定义 写成("去你妈的")   这样在main
			//dispatchEvent(new Event(Event.CLOSE));  
			dispatchEvent(new Event("关卡1"));  
		}
		
		private function clickHnadler2(event:MouseEvent):void  
		{
			 DieListener( );
			dispatchEvent(new Event("关卡2"));  
		}
		
		private function clickHnadler3(event:MouseEvent):void  
		{
			 DieListener( );
			dispatchEvent(new Event("关卡3"));  
		}
		
		private function clickHnadler4(event:MouseEvent):void  
		{
			 DieListener( );
			dispatchEvent(new Event("关卡4"));  
		}
		
	 
		
		
		
		
		
		
		
		
		
		private function DieListener( ):void  
		{
			this.guankamc.startbtn.removeEventListener(MouseEvent.MOUSE_DOWN, clickHnadler);  
			//this.guankamc.startbtn.removeEventListener(MouseEvent.MOUSE_OVER, clickHnadler);  
			
			this.guankamc.startbtn2.removeEventListener(MouseEvent.MOUSE_DOWN, clickHnadler2);  
			this.guankamc.startbtn3.removeEventListener(MouseEvent.MOUSE_DOWN, clickHnadler3);  
			this.guankamc.startbtn4.removeEventListener(MouseEvent.MOUSE_DOWN, clickHnadler4);  
			//this.guankamc.startbtn2.removeEventListener(MouseEvent.MOUSE_OVER, clickHnadler2);  
			//this.guankamc.startbtn3.removeEventListener(MouseEvent.MOUSE_OVER, clickHnadler3);  
			//this.guankamc.startbtn4.removeEventListener(MouseEvent.MOUSE_OVER, clickHnadler4);  
			 
		}
		//this.addEventListener(MouseEvent.MOUSE_DOWN, clickHnadler);  
	
		

	}
	
}