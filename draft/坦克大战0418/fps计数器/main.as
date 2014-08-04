package  {
	
	import flash.display.MovieClip;
	//import FPSShow;
	
	public class main extends MovieClip {
		
		
		
		var spsshow:FPSShow=new FPSShow;
 
			var spsshow2:FPSCalculator=new FPSCalculator;
		
		
		public function main() {
					addChild(spsshow);
			spsshow.x=200;
					addChild(spsshow2);
				spsshow2.x=10;
			// constructor code
		}
	}
	
}
