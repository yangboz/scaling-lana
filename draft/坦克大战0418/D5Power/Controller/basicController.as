package D5Power.Controller 
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import D5Power.Objects.gameObject;
	/**
	 * 基础控制器
	 * @author D5Power
	 */
	public class basicController  extends Sprite
	{
		/**
		 * 控制对象
		 */
		protected var _target:gameObject;
		
		public function basicController() 
		{
			trace("安装基础控制器")
		}
		/* 设置控制对象
			set顾名思义是设置的意思。我们如果没有写set函数，那么该属性只是一个只读属性。如果我们设置了这个set函数，
			那么该属性就可以读也可以设置。我们来看上面的脚本，这个函数接受了一个参数，该参数就是我们设置属性时要传递的值。
			请大家注意，set函数没有返回值，如果你设置了返回值，那么将会倒是编译错误。这就是类中声明定义的方法。
		 */
		public function set target(obj:gameObject):void
		{
			//trace("15x");
			//trace("15x", obj); 
			_target = obj; 
			trace("指定控制目标", _target); 
		}
		//monster自动运行
		 public function AutoRun():void{}
		/**
		 * 消亡
		 */
		public function die():void{}
		
	}

}