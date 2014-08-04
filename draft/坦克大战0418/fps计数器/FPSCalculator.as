

 package  {    
           import flash.text.TextField;
    //imports  
	import flash.events.Event;  
    import flash.events.Event;  
    import flash.utils.getTimer;  
    import flash.display.MovieClip;  
	 
	import flash.display.Stage;
	 
    public class FPSCalculator extends MovieClip {  
		
		            private var txt2:TextField;
                        //private var count:int=0
		
		
		//public static var stage:Stage; 
        //variable to hold the current time  声明的当前时间
        private var currentTime:int = 0;  
		trace("x")
        public function FPSCalculator() {  
			
			
					txt2=new TextField();//创建文本实例
					txt2.textColor=0x0066FF;//设置文本颜色
					addChild(txt2)//加载这个文本
			
			
			
			
		var stage:Stage; 
		trace("1")
		//add the enter frame listener, this is fired when the SWF updates to a new frame  
		//添加输入帧监听器，这是时激发的 SWF 将更新为一个新的帧数
		this.addEventListener(Event.ENTER_FRAME, onFrameLoop);  
			
		trace("2")
        }  
   
        private function onFrameLoop (evt:Event):void{  
		 
            //for the sanity of the fellow developers, try to put each task into a seperate function.  健全的其他开发人员，试图把每个任务放到一个单独的函数。
            //this makes it infinitely easier to read for them and yourself on a large project or when you come back to and old one  
			//无限地使容易阅读他们和你自己上的一个大的项目或当你回到老一
            //since the getTimer() function returns the played time in milliseconds and we want FPSecond, we divide it into 1000  
			//since 的 getTimer() 函数返回播放的时间 （毫秒） 和我们想要 FPSecond，我们将它分成 1000
            var fps:int = (1000 / timeDifference);  
			txt2.text="FPS="+fps;
            //trace(fps);  
        }  
        //this is a get function so it can be referenced just like a variable, without the brackets on the end like a normal function  
		//this 是 get 函数，所以它可引用就像一个变量，无上像一个正常的函数结束括号
        private function get timeDifference ():int{  
   
            //the getTimer() function returns the total played time of the SWF in milliseconds  
			//the getTimer() 函数返回 SWF 的总播放的的时间 （毫秒）
            var totalPlayedTime:int = getTimer();  
   
            //The difference in time from the previous frame to this frame will to calculated here  
			//到此帧上一帧的时间 //The 差将到这里计算
            var timeDifference:int = (totalPlayedTime - currentTime);  
   
            //The currentTime is set to the total played time so it is ready for the next frame  
			//The currentTime 设置为共播放的时间，所以它是准备下一帧
            currentTime = getTimer();     
   
            //return the difference in time  
			//return 时间的差异
            return timeDifference  
        }  
    }  
}   