package  D5Power.Scene
{
	import flash.display.Sprite
	import flash.events.MouseEvent;
		import flash.events.Event;
	import flash.events.FocusEvent
	import flash.display.MovieClip;
	import flash.net.SharedObject;
	import com.sixuu.SCookie;
	
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	public class Usermain extends MovieClip 
	{
		trace("xxx")
			
			//var userArray:Array=[["ssssss"],["xxxxxx"]];
			//var _scoreUP:MovieClip;
			public  var _usermainMC:MovieClip;
			
			//var _username:String;
			//var _userHP:int=10;
			//var _userspeed:int=1;
			//var _userScore:int=100;
			
			public function Usermain()
			{
				//_username=Global._usernameG;
				trace("Global",Global)
		
				_usermainMC=new UsermainMC();
						trace("Global", Global._usernameG)
				addChild(_usermainMC)
				//初始化文本框,依次为 输入,动态,静态文本,
				
				_usermainMC.saveTxt.text = Global._usernameG;
				//检测焦点是否在输入框中
				_usermainMC.saveTxt.addEventListener(FocusEvent.FOCUS_IN,qikong);
				_usermainMC.saveTxt.addEventListener(FocusEvent.FOCUS_OUT,qikong2);
				
				trace("_usermainMC.saveTxt",_usermainMC.saveTxt.text)
				//_username=_usermainMC.saveTxt.text;

				 redCookie(Event);
				//删除所有信息
				_usermainMC.clearBtn.addEventListener (MouseEvent.CLICK,mouseClear);
				//保存名称
				_usermainMC.saveBtn.addEventListener (MouseEvent.CLICK,mouseReleaseInSaveBtn);
				//测试用数据更新
				_usermainMC._scoreUP.addEventListener (MouseEvent.CLICK,mouseReleaseInScoreUP);
				_usermainMC._scoreDemo.addEventListener (MouseEvent.CLICK,mouseReleaseInScoreDemo);
				
			}
			
			public  function userdie():void
			{
				_usermainMC.saveTxt.removeEventListener(FocusEvent.FOCUS_IN,qikong);
				_usermainMC.saveTxt.removeEventListener(FocusEvent.FOCUS_OUT,qikong2);
				_usermainMC.clearBtn.removeEventListener (MouseEvent.CLICK,mouseClear);
				//保存名称
				_usermainMC.saveBtn.removeEventListener (MouseEvent.CLICK,mouseReleaseInSaveBtn);
				//测试用数据更新
				_usermainMC._scoreUP.removeEventListener (MouseEvent.CLICK,mouseReleaseInScoreUP);
				_usermainMC._scoreDemo.removeEventListener (MouseEvent.CLICK,mouseReleaseInScoreDemo);
			}
			
			
			
			function qikong(e:FocusEvent):void
			{_usermainMC.saveTxt.text ="";}
			
			function qikong2(e:FocusEvent):void
			{ if(_usermainMC.saveTxt.text =="")
				{_usermainMC.saveTxt.text = Global._usernameG}
				}
			
			//游戏开始时判断有无本地数据    无 设置初始数据    有调取本地数据
			public function redCookie(Event)
			{
				trace("SCookie.getCookie(_username)",SCookie.getCookie("用户","用户name"));
				if(SCookie.getCookie("用户","用户name")==undefined||SCookie.getCookie("用户","用户name") == null)
				{ 	
					trace("数据无   初始化数据")
					SSetCookie();
					_usermainMC.errorTxt.text ="数据初始化";
					
				}
				else
				{
					trace("已经写入过数据")
					GGetCookie();
					_usermainMC.errorTxt.text ="调取数据成功";
				}
					
			}
//------------------------------------------------------------------------------
			//设置本地数据
				public function SSetCookie()
			{
				
				SCookie.setCookie("用户","用户name",Global._usernameG)
				SCookie.setCookie("用户","用户HP",Global._userHP)
				SCookie.setCookie("用户","用户Speed",Global._userspeed)
				
				 showcookie();
			}
			//调取本地数据
				public function GGetCookie()
			{
				
				Global._usernameG=SCookie.getCookie("用户","用户name")
				Global._userHP=SCookie.getCookie("用户","用户HP")
				Global._userspeed=SCookie.getCookie("用户","用户Speed")
				
				showcookie();
				
			}
//------------------------------------------------------------------------------
			//删除本地所有数据
			public function mouseClear(Event)
			{ 
				SCookie.clearCookie("用户")   
				_usermainMC.errorTxt.text ="删除成功";
			}
//-------------------------------------------------------------------------------
			///保存本地数据
			function mouseReleaseInSaveBtn (event:MouseEvent)
			{
				
				//SCookie.setCookie("cookie名称" ,"cookie属性名",cookie属性的内容)
				//如果要写入的字符串不为空
				if (_usermainMC.saveTxt.text != "")
				{
					try
					{
						//读取要写入的字符串
						Global._usernameG=_usermainMC.saveTxt.text;
						 SSetCookie()
						_usermainMC.errorTxt.text ="名称修改成功";
					}
					catch (error:Error)
					{
						_usermainMC.errorTxt.text = "保存数据功能未打开";

					}
					//输出当前状态
					//_usermainMC.errorTxt.text = "保存成功";
				}
				else
				{
					//如果 要写入的字符串为空 则输出错误信息
					_usermainMC.errorTxt.text = "请填写要储存的信息";
				}
			}
			
			function showcookie()
			{
					_usermainMC.loadTxtName.text = Global._usernameG;
					_usermainMC.loadTxtHP.text =Global._userHP
					_usermainMC.loadTxtSpeed.text = Global._userspeed
					_usermainMC.saveTxt.text = Global._usernameG;
			}
			function mouseReleaseInScoreUP (event:MouseEvent)
			{		
					Global._userHP=Global._userHP+10;
					Global._userspeed=Global._userspeed+1; 
					SCookie.setCookie("用户","用户HP",Global._userHP)
					SCookie.setCookie("用户","用户Speed",Global._userspeed)
			}
			function mouseReleaseInScoreDemo (event:MouseEvent)
			{		
					Global._userHP=Global._userHP-10;
					Global._userspeed=Global._userspeed-1;
					 
					SCookie.setCookie("用户","用户HP",Global._userHP)
					SCookie.setCookie("用户","用户Speed",Global._userspeed)		 
			}
			
			
			
	}
	
}