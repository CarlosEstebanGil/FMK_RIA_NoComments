package framework.components.Login.Application.domain
{
	import mx.collections.XMLListCollection;

	public class LoginGlobalModel {
		private var _loginUrl:String=null;
		public function get loginUrl():String {
			return _loginUrl;
		}
		
		public function set loginUrl(completeURL:String):void {
			_loginUrl = completeURL;
		}
		
		
		//estas funciones son las que van a ser ejecutadas en el onResult y en el onFault actions del cmd ( del svc y en mi esquema del cmd )
		private var _onResultGranted:Function=standardResultGrantedHanler;
		private var _onResultDenied:Function=standardResultDeniedHanler;
		private var _onFault:Function=standardFaultHanler;
	
		private var getBoolValueFromResultEventData:Function=standardGetBoolValueFromResultEventData;
		
		// login ok (tanto granted como denied ) comparten el levantar el rtado del resultEvent param del onResult y conocen el xml devuelto y
		// llaman a una func standard q se llame getBoolResult q xa ese xml sabe como obtenerla y devuelve true o false pero esta funcion
		// tambien debe figurar como handler publico con posibilidad de q la app cli pueda redefinirla x si la estructura es otra!!!!!!!!!!
		public function standardResultGrantedHanler():void {
			//Algortimo standard loginOk: crea un obj usuario con toda la data, lo attacha al msge de rta del modulo xa loginokok y lanza evt
			
		}
		
		public function standardResultDeniedHanler():void  {
			//Algortimo standard loginDenied: crea un obj usuario con toda la data, lo attacha al msge de rta del modulo xa loginokok y lanza evt
			
		}

		public function standardGetBoolValueFromResultEventData(data:Object):Boolean  { // <- meter un setter wrapper xa este tmb en el login.mxml
			//Algortimo standard getBoolValueFromResult: sabe q es un resultEvent igual en este caso no es necesario castear al mismo ya
			// q puede accesar al xml y al nodo y valor del rtado del svc en el xml con data.nodoNoRaiz2doNivel.blabla (mi xml structura
			// conocida identica xa todos los boolean ) y si es 1 retorna true mientras q si es 0 retorna false.
			return true;
		}
		
		
		public function standardFaultHanler():void  {
			
		}

		
		public function get onFault():Function {
			return _onFault;
		}

		public function set onFault(value:Function):void {
			_onFault = value;
		}

		public function get onResultDenied():Function {
			return _onResultDenied;
		}

		public function set onResultDenied(value:Function):void {
			_onResultDenied = value;
		}

		public function get onResultGranted():Function {
			return _onResultGranted;
		}

		public function set onResultGranted(value:Function):void {
			_onResultGranted = value;
		}

		public function LoginGlobalModel() {
		}
		

		/* [Bindable]
		public var userData:XMLListCollection;  
		
		[Bindable]
		public var strFlagMsge:String; */ 
	}
}