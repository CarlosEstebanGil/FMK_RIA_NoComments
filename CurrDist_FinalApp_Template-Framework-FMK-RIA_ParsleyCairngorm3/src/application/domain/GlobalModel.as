package application.domain 
{
	import framework.IMainAppGlobalModel;
	import framework.Fmk_Constants;
	import framework.IMainAppGlobalModel;
	
	import mx.collections.ArrayCollection;
	import mx.collections.XMLListCollection;

	public class GlobalModel implements IMainAppGlobalModel
	{
		
		
		[Bindable]
		public var servicios:Object; 
		
		[Bindable]
		public var loginResult:Boolean=false;  
		
		[Bindable]
		private var currLanguage:String=Fmk_Constants.DEFAULT_LANGUAGE;
		
		[Bindable]
		private var currPerms:ArrayCollection=null;

		[Bindable]
		private var currUser:Object=null;


		public function getLanguage():String {
			return this.currLanguage;
		}
		
		public function getPerms():ArrayCollection {
			return this.currPerms;
		}
		
		public function getServices():Object {
			return this.servicios;
		}
		
		public function getUser():Object {
			return this.currUser;
		}
		
		public function isUserLoggedIn():Boolean {
			return loginResult;
		}
		
		public function setLanguage(lang:String):void {
			this.currLanguage=lang;	
		}
		
		public function setPerms(perms:ArrayCollection):void {
			this.currPerms=perms;
		}
		
		public function setServices(serviciosParam:Object):void {
			this.servicios=serviciosParam
		}
		
		public function setUser(user:Object):void {
			this.currUser=user;
		}
		
		public function setUserLoggedIn(userLoggedInValue:Boolean):void {
			this.loginResult=userLoggedInValue;
		}
		
		public function GlobalModel() {	
			
		}
	}
}