package D5Power.MyInterface
{
	
	/**
	 * 射击接口
	 * @author D5Power
	 */
	public interface IShoot 
	{
		/**
		 * 射击方法通过implement关键字，让Player类实现了IShoot接口。之后，必须实现接口所规定的全部标准（方法）。
		在IShoot接口中，只写了Shoot一个方法，因此，Player已经声明支持IShoot接口，它就必须要有Shoot方法，
		否则FLASH将提出严正抗议（编译报错。。。）
		 */
		trace("shoot 接口方法1")
		function Shoot():void;
		trace("shoot 接口方法2")
		
	}
	
}