package framework.components.Login.Application.bussiness.Entities
{
	//20140828 creo q no vá import Modules.ABMPersonas.Application.bussiness.Entities.IUser;

	  public class User implements IUser
	{
		  //20141210
		  public static const USUARIO_INTERNO:int = 1; 	
		  public static const PROVEEDOR:int = 2;
		  public static const CLIENTE:int = 3;
		  
			private var _userId:String="";
			private var _userName:String="";
			private var _userPass:String="";
			private var _lastName:String="";
			private var _address:String="";
			private var _email:String="";
			private var _age:int=-1;
			private var _genre:String="";
			private var _city:String="";
			private var _country:String="";
			
			public function User()
			{
			}
			
			public function get country():String
			{
				return _country;
			}
			
			public function set country(value:String):void
			{
				_country = value;
			}
			
			public function get city():String
			{
				return _city;
			}
			
			public function set city(value:String):void
			{
				_city = value;
			}
			
			public function get genre():String
			{
				return _genre;
			}
			
			public function set genre(value:String):void
			{
				_genre = value;
			}
			
			public function get age():int
			{
				return _age;
			}
			
			public function set age(value:int):void
			{
				_age = value;
			}
			
			public function get email():String
			{
				return _email;
			}
			
			public function set email(value:String):void
			{
				_email = value;
			}
			
			public function get address():String
			{
				return _address;
			}
			
			public function set address(value:String):void
			{
				_address = value;
			}
			
			public function get lastName():String
			{
				return _lastName;
			}
			
			public function set lastName(value:String):void
			{
				_lastName = value;
			}
			
			public function get userPass():String
			{
				return _userPass;
			}
			
			public function set userPass(value:String):void
			{
				_userPass = value;
			}
			
			public function get userName():String
			{
				return _userName;
			}
			
			public function set userName(value:String):void
			{
				_userName = value;
			}
			
			public function get userId():String
			{
				return _userId;
			}
			
			public function set userId(value:String):void
			{
				_userId = value;
			}
			
		}
}