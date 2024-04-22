package application.events
{
	import flash.events.Event;
	
	public class LoginResultEvt extends Event
	{
		
		public static const LOGIN_RESULT_EVT:String="LoginResultEvt";
		
		public var loginResult:Boolean=false;
		
		public function LoginResultEvt(type:String, messageParam:Boolean,  bubbles:Boolean=false, cancelable:Boolean=false) {
			loginResult = messageParam;
			super(type, bubbles, cancelable);
		}
	}
}