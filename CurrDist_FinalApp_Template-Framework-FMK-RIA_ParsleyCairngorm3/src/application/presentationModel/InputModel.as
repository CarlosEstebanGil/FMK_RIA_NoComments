package application.presentationModel
{
	import application.domain.GlobalModel;
	 
	public class InputModel
	{
		[Inject]
		[Bindable]
		public var model:GlobalModel;
		
		[MessageDispatcher]
		public var sendMessage:Function;
		
		[Bindable]
		public var labelSend:String="Enviar Mensaje";
		
		[Bindable]
		public var labelText:String="Enviar";
		
		public  function sendInputMSG(txt:String):void
		{
			 
			
		}
		
		public function InputModel()
		{
		}
	}
}