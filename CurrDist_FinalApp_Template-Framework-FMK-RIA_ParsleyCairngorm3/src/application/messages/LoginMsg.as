package application.messages
{

		public class LoginMsg
		{
			public static const LOGIN_MSG:int=1
			
			private var _type:int; 
			
			public function LoginMsg(tipo:int)
			{
				_type=tipo;
			}
			
			[Selector]
			public function get type():int { 
				return _type;
			}
		}
}
