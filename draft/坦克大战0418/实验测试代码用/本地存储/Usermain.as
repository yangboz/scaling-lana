package  
{
	import flash.display.Sprite
	import flash.events.MouseEvent;
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
			var _scoreUP:MovieClip;
			var _usermainMC:MovieClip;
			
			var _username:String;
			var _userHP:int=10;
			var _userspeed:int=1;
			var _userScore:int=100;
			
			public function Usermain()
			{
				_scoreUP=new ScoreUP();
				_scoreUP.x=30;
				_scoreUP.y=300;
				addChild(_scoreUP)
				_scoreUP.addEventListener (MouseEvent.CLICK,mouseReleaseInScoreUP);
				
				_usermainMC=new UsermainMC();
				addChild(_usermainMC)
				////初始化文本框,依次为 输入,动态,静态文本,
				_usermainMC.saveTxt.addEventListener(FocusEvent.FOCUS_IN,qikong);
				_usermainMC.saveTxt.text = "saver";
				_usermainMC.errorTxt.text = "";
				_usermainMC.loadTxtName.text = "玩家名称";
				_usermainMC.loadTxtHP.text = "玩家HP";
				_usermainMC.loadTxtSpeed.text = "玩家Speed";
				_usermainMC.loadTxtScore.text	= "玩家Score";
			//SCookie.setCookie("cookie名称" ,"cookie属性名",cookie属性的内容)	
			//注册 saveBtn按钮事件
			_usermainMC.saveBtn.addEventListener (MouseEvent.CLICK,mouseReleaseInSaveBtn);
			//注册 loadBtn按钮事件
			_usermainMC.loadBtn.addEventListener (MouseEvent.CLICK,mouseReleaseInLoadBtn);
				
			}
			
			function qikong(e:FocusEvent):void
			{

			_usermainMC.saveTxt.text ="";
			}
			
			
			 function mouseReleaseInScoreUP (event:MouseEvent)
			{		
					_userHP=_userHP+10;
					_userspeed=_userspeed+1;
					_userScore=_userScore+100;
					SCookie.setCookie(_username,"用户HP",_userHP)
					SCookie.setCookie(_username,"用户Speed",_userspeed)
					SCookie.setCookie(_username,"用户Score",_userScore)
			}
			
			
			
			

			 
			///写入本地数据
			function mouseReleaseInSaveBtn (event:MouseEvent)
			{
				
				//SCookie.setCookie("cookie名称" ,"cookie属性名",cookie属性的内容)
				//如果要写入的字符串不为空
				if (_usermainMC.saveTxt.text != "")
				{
					try
					{
						//读取要写入的字符串
						_username= _usermainMC.saveTxt.text;
					
					}
					catch (error:Error)
					{
						_usermainMC.errorTxt.text = "保存数据功能未打开";
					}
					//输出当前状态
					_usermainMC.errorTxt.text = "保存成功";
				}
				else
				{
					//如果 要写入的字符串为空 则输出错误信息
					_usermainMC.errorTxt.text = "请填写要储存的信息";
				}
			}
			
			

			
			///读取本地数据
			function mouseReleaseInLoadBtn (event:MouseEvent)
			{
			_usermainMC.errorTxt.text = "";
			_usermainMC.saveTxt.text = "";
			//读取 名字为 userHighScore 对象的 highScore 属性
				try
				{
					
					SCookie.getCookie(_username,"用户HP")
					SCookie.getCookie(_username,"用户Speed")
					SCookie.getCookie(_username,"用户Score")
				//var so:SharedObject = SharedObject.getLocal("userHighScore","/abccc");
					//trace( "SCookie.getCookie(_username)",SCookie.getCookie(_username,"用户HP"))
					
					_usermainMC.loadTxtName.text = _username;
					_usermainMC.loadTxtHP.text =SCookie.getCookie(_username,"用户HP")
					_usermainMC.loadTxtSpeed.text = SCookie.getCookie(_username,"用户Speed")
					_usermainMC.loadTxtScore.text = SCookie.getCookie(_username,"用户Score")
					
				}	
				catch (error:Error)
				{
				_usermainMC.errorTxt.text = "没有存储任何文本";
				}

			}
			


			
			
	}
	
}