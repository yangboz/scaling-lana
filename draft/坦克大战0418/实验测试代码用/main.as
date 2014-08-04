package  
{
	import flash.display.Sprite
	import flash.events.MouseEvent
	import flash.display.MovieClip;
	
	public class main extends MovieClip 
	{
		trace("xxx")
		var B1:b1=new b1()
			var B2: b2=new b2()
		public function main()
		{
		// constructor code
					addChild(B1);
				
		
		
	
		
		B1.addEventListener(MouseEvent.CLICK,px)
	
		B2.addEventListener(MouseEvent.CLICK,px1)
			addChild(B2);
				B2.x=20
			B2.y=200
		}
			
		function px(evt:MouseEvent):void
		{
		/*使用getChildAt（）返回值是displayObject类是抽象类，一定要实例化才能使用（也就是批定为一个具体的实例下面才能操作）*/
		var sp:MovieClip= stage.getChildAt(0) as MovieClip
		trace(sp.name)  //实例操作
		trace(sp)          //实例操作

		trace(stage.numChildren) //实例操作
		/*类似：

		var yy:Sprite =evt.target as Sprite
		yy.x=300  */      
		}
		 function px1(evt:MouseEvent):void
		{
		var sp1:Sprite= stage.getChildAt(0) as Sprite
		trace(sp1)
		trace(sp1.name)
		trace(stage.numChildren)
		}	
			
			
	}
	
}
