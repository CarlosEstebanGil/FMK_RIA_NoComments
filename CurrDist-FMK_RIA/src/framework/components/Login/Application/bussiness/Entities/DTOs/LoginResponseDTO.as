package framework.components.Login.Application.bussiness.Entities.DTOs
{
	public class LoginResponseDTO
	{
		private var _userName:String="";
		private var _loginResult:int=0;
		
	
		public function LoginResponseDTO(userNameParam:String, rtaLoginParam:int)
		{
			this._userName=userNameParam;
			this._loginResult=rtaLoginParam;
		}

		
		public function get userName():String
		{
			return _userName;
		}

		public function set userName(value:String):void
		{
			_userName = value;
		}

		public function get loginResult():int
		{
			return _loginResult;
		}

		public function set loginResult(value:int):void
		{
			_loginResult = value;
		}

	}
}