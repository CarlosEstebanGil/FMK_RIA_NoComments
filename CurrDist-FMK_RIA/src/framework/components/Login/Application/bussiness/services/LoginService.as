package framework.components.Login.Application.bussiness.services
{
	import framework.components.Login.Application.bussiness.Entities.DTOs.LoginResponseDTO;
	import framework.components.Login.Application.domain.LoginGlobalModel;
	//20140828 creo q no vá -> import framework.components.Login.Application.messages.LoginResultMessage;
	import framework.components.Login.Application.presentationModel.MainScreenModel;
	
	//20140828 creo que no vá -> import application.events.LoginResultEvt;
	
	import framework.EService;
	
	import mx.collections.XMLListCollection;

	public class LoginService extends EService {
	/*	[Inject] 							
		public var model:LoginGlobalModel; 	
		
		[Inject]
		public var mainScreenModel:MainScreenModel;  
		
		
		[MessageDispatcher]
		public var sendMessage2:Function; 
		
		
		
		 override public function standardAction(dataXMLCollection:XMLListCollection):void {
			model.strFlagMsge="servicio ejecutado. onResult Handler Ejecutado. Modelo actualizado.";
			mainScreenModel.txtTmpText=dataXMLCollection.toString();
			
			var r:int=1 ;  
				
			var loginResponseDTO:LoginResponseDTO = new LoginResponseDTO(mainScreenModel.userName,r ); //(txtUserName.text,txtUserPass.text);
		
			var loginResultMessage:LoginResultMessage = new LoginResultMessage(LoginResultMessage.LOGIN_RESULT_MESSAGE);
			
			loginResultMessage.data=loginResponseDTO;
		

			var boolR:Boolean=true;
			var loginResultEvt =  new LoginResultEvt(LoginResultEvt.LOGIN_RESULT_EVT,boolR)
		
			dispatchEvent(loginResultEvt); 
		}
		
		
		*/
	}
	
	
		
}