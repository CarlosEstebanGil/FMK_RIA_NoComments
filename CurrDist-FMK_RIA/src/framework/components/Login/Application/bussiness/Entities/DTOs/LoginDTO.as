package framework.components.Login.Application.bussiness.Entities.DTOs
{
	import framework.Fmk_Constants;

	public class LoginDTO
	{
		private var _userName:String="";
		private var _userPass:String="";
		//20141018
		private var _language:String=Fmk_Constants.DEFAULT_LANGUAGE; //"EN o ES".
		
		/*20141210
		private var _user_id:String="";
		private var _idtipo:int=0;*/
		
  
		
		//20141018
		//public function LoginDTO(userNameParam:String, userPassParam:String)
		public function LoginDTO(userNameParam:String, userPassParam:String, languageParam:String)			
		{
			this._userName=userNameParam;
			this._userPass=userPassParam;
			this._language=languageParam;
			
		}

	/*	
		public function get user_id():String
		{
			return _user_id;
		}

		public function set user_id(value:String):void
		{
			_user_id = value;
		}

		public function get idtipo():int
		{
			return _idtipo;
		}

		public function set idtipo(value:int):void
		{
			_idtipo = value;
		}
*/
		public function get language():String
		{
			return _language;
		}

		public function set language(value:String):void
		{
			_language = value;
		}

		public function get userName():String
		{
			return _userName;
		}

		public function set userName(value:String):void
		{
			_userName = value;
		}

		public function get userPass():String
		{
			return _userPass;
		}

		public function set userPass(value:String):void
		{
			_userPass = value;
		}

	}
}