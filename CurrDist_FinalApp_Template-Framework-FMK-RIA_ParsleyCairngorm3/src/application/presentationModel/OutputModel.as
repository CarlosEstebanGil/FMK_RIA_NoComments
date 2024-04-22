package application.presentationModel
{
	import application.domain.GlobalModel;
	import application.messages.LoginMsg;
 

	public class OutputModel
	{
		
		[Inject]
		[Bindable]
		public var model:GlobalModel;  
		
		[Bindable]
		public var messages:String="";
		
		[Bindable]
		public var labelText:String="Mensajes recibidos";
		
		[MessageHandler]
		public function sendInputMSGHandler(messageArg:LoginMsg):void  
		{
		 
		}
			
		
		public function OutputModel()
		{
		}
	}
}