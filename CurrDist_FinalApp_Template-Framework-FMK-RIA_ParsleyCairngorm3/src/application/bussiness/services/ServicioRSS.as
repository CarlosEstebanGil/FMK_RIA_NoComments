package application.bussiness.services
{
	import mx.collections.XMLListCollection;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	import application.domain.GlobalModel;
	
	public class LoginService extends HTTPService implements ILoginService, IResponder
	{
		[Inject]
		public var model:GlobalModel;
		
		public function LoginService(rootURL:String=null, destination:String=null)
		{
			super(rootURL, destination);
			this.showBusyCursor=true;
		}
		
		public function recuperaRSS(url:String):AsyncToken
		{
			this.url = url;
			this.resultFormat="e4x"
				
			var llamada:AsyncToken=this.send();
			llamada.addResponder(this);
			
			return null;
		}
		
		public function result(data:Object):void
		{
			var evento:ResultEvent = data as ResultEvent;
			
			var datosXML:XMLList = XML(evento.result)..item;
			model.datosRSS=new XMLListCollection(datosXML); 
		}
		
		public function fault(info:Object):void
		{
			var evento:FaultEvent = info as FaultEvent;
			Alert.show(evento.fault.message,evento.fault.faultDetail);
		}
	}
}