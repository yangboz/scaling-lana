package D5Power.Objects 
{
	import flash.display.Sprite;
	import D5Power.Objects.hitMC;
	
	
	//基础游戏对象
	public class gameObject extends Sprite
	{
		//所属阵营  1：玩家   2：敌人   3：第三方  
		public var part:uint=0;
		
		//是否参与碰撞属性检测
		protected var _hitTest:Boolean = false;
		
		//声明碰撞区域 
		public var hitmcX:hitMC=new hitMC;
		public var hitmc=hitmcX;
	 
		public function gameObject() 
		{
			//trace("gameObject任何子类调用时都会调用它++")
		}
		
		//行为 虚函数
		public function Do():void
		{
		}
		
		//被攻击减血 虚函数
		public function Hurt(val:uint):void
		{
		}
		
		//碰撞检测 get
		public function get hitTest():Boolean
		{	
			return _hitTest;
		}

		//死亡
		public function die():void
		{
			trace("game 删除————————1")
			//Global.scene.removeObject(this);
			trace("game 删除————————2")	
		}
		
	}

}