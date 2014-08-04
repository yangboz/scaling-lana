/*
SCookie.setCookie("cookie名称" ,"cookie属性名",cookie属性的内容)

读取：

SCookie.getCookie("cookie名称","属性名称")

清除：
SCookie.clearCookie("cookie名称")

eg：
import com.sixuu.SCookie

SCookie.setCookie("test","name","liam")
SCookie.setCookie("test","sex","male")
SCookie.setCookie("test","age",22)

  trace(SCookie.getCookie("test","name")) //liam

  trace(SCookie.getCookie("test","sex")) //male

  trace(SCookie.getCookie("test","age")) //22
*/
package com.sixuu {
	import flash.net.SharedObject;
	
	public class SCookie {

		public function SCookie() {
			
		}
		//保存参数属性
	    static public function setCookie(cookieName:String,propertyName:String,value:Object){
			var so:SharedObject=SharedObject.getLocal(cookieName,"/")
			so.data.cookieName;
			//trace("so.data.cookieName",so.data.cookieName=cookieName)
			//trace("so.data.propertyName=",so.data.propertyName=propertyName)
			so.data[propertyName]=value;
			//trace("so.data.propertyName=",so.data.propertyName)
			//trace("so.data[propertyName]",so.data[propertyName])
			so.flush()
		}
		//读取保存的属性
		public static function getCookie(cookieName:String,propertyName:String )
		{ 
            var so:SharedObject=SharedObject.getLocal(cookieName,"/")
			//trace("so.data[propertyName]=xxx",so.data[propertyName])
			return so.data[propertyName];
			
		}
		
         public static function clearCookie(clearedCookieName:String )
		{ 
            var so:SharedObject=SharedObject.getLocal(clearedCookieName,"/")
			so.clear()
			
		}

	}
	
}
