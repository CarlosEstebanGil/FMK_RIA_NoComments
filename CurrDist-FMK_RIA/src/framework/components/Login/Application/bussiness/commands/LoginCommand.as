package framework.components.Login.Application.bussiness.commands 
{
	
	import flash.events.Event;
	
	import framework.ECommand;
	import framework.ECommand_File;
	import framework.EFlexEvent;
	import framework.EMessage;
	import framework.EService;
	import framework.IMessage;
	import framework.IService;
	import framework.Logger;
	import framework.components.Login.Application.bussiness.Entities.DTOs.LoginDTO;
	import framework.components.Login.Application.bussiness.Entities.User;
	import framework.components.Login.Application.domain.LoginGlobalModel;
	import framework.components.Login.Application.presentationModel.MainScreenModel;
	import framework.components.Login.data.conf.Messages;
	
	import mx.collections.XMLListCollection;
	import mx.events.FlexEvent;
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.events.FaultEvent;
	
	public class LoginCommand extends ECommand { // ECommand_File { // habilitar -> ECommand {
		
		public function LoginCommand() { 
			super(); // <- DON'T FORGET !!!!!!
		}
		
/*		Este Bloque era una prueba de la impl de la clase como un extends ECommand_File ( y FUNCIONA ) !!!!!!!
		
		override public function action(data:Object):void { //(dataXMLCollection:XMLListCollection):void {
			trace("download ok, do some action .. "); 
		}
		
		override public function fault(data:Object):void { 
			trace("LoginCommand.fault(data)");
		}
		
		override public function get url():String { 
			var r:String=null;
			try {
				r = "http://localhost:8080/FMK-DynamicWEB/ServiceLocator?svc=getExcelFileFromQueryADU&codAduBase=1&codAduTop=50"; //model.servicios.login; 
			} 
			catch(error:Error) {
				trace(error.message);
			}
			finally{
				return r;				
			}
			
		}
	}		
	
*/ 
		
		private static const LOG:ILogger = Logger.getLogger(LoginCommand);
		
		// 20140828 
		//20141001 (SAQUÉ PARSLEY) (*)
		//[Inject]
		[Bindable]
		public var loginGlobalModel:LoginGlobalModel; // <- COMO es public lo seteo explicitamente desde el msPM (*)
		 
		//20141001 (SAQUÉ PARSLEY) (*)
		//[Inject]
		//[Inject]
		[Bindable]
		public var pmModel:MainScreenModel;// <- COMO es public lo seteo explicitamente desde el msPM (*)
		
		//20141001 (SAQUÉ PARSLEY) (*)
		//[Inject (id="LoginSvc")]	
		public var svc:IService=new EService(); //idem a lo q instanciaba ioc parsley en conf.mxml !
												// Obs:EService se usaba ref con <<i>> y funcaba todo, y no usaba xa nada parsley .
		public var _url:String= "no usar. usar el getter"; 
		
		override public function getService():IService {
			return this.svc; 
		}
		
		
		
		// Login command no es un ABMCommand x lo q extiende directamente ECommand. Ecommand ejecuta de una el execute del service
		// y no setea ningún action. tal vez deberia meter 2 functions de action y fault 1 a 1 con las del svc y q deban overridearse
		// y q ent el execute "abstracto" del ECommand las setee ? .. SEEEE , Total ABMCommand extiende ECommand pero overridea el 
		// cmd.execute y setean el svc.resultAction y el svc.faultAction con lo suyo ( un case e/ a/b/m/c ) mientras q el ecommand
		// hace similar pero con estas son funcs de una y sin un case.. (estas 2 funcs son idem las standardAction y StandardFault
		// de la clase eservice pero en esa clase las dejo tmb x si la quiero usar x separado sin un commando o commando de mi fmk api..
		
		override public function action(data:Object):void { //(dataXMLCollection:XMLListCollection):void {
			var r:int; //todo hacer que tmb venga la data del user y atacharla al msge de rta?.. 
			
			//20140904 var response_message:FlexEvent; //20140520 var response_message:IMessage 
			var response_message:EFlexEvent; //20140520 var response_message:IMessage
			try {
				//20140702 r = data.result.qry.item.userValid as int; 
				r= data.result.qry.item.attribute("userValid").toString();
				if ( r == 1 ) {
//		  NEW 20140520 Cambio esto por mensajeria flex basica .. 
//					response_message = new EMessage(Messages.LOGIN_GRANTED_RESPONSE_MESSAGE); //es el 79. puede referenciarse Msges.kte from modulo usuario
//						
//					 //TODO .. levantar la data del user from svc result (hacer q el svc ya lo traiga como adicional xa el login granted)
//					 response_message.data= new User(); //TODO-> Setearle la data al user obj. //UserDTO_baja;
//					 
//					 //deleteRequestMessage.subtype=EMessage.BAJA; //Sin subType x q no es para disparar un a/b/m  o c sino una action sola (ecomd.action)
//					
//					sendMessage(response_message); //-> El modulo/comp usuario debe estar escuchando x esta kte msge id 79! //(deleteRequestMessage); 
//		
					//20140904
					//response_message = new FlexEvent(Messages.LOGIN_GRANTED_RESPONSE_MESSAGE); //("LOGIN_GRANTED"); //no sirve , espera type String, meto una kteStr xero meterla en la conf en messages.as!!!! (Messages.LOGIN_GRANTED_RESPONSE_MESSAGE); //es el 79!!??sirve???? o ya existe en fmk flex api??
					response_message = new EFlexEvent(Messages.LOGIN_GRANTED_RESPONSE_MESSAGE); //xq necesito la data del user.
					var dataOut:Object = new Object() ; //lo uso tipo dinamic object.. x una cuestión de rapidez nomás..

					var loginDTO:LoginDTO= this.message.data as LoginDTO;
					   
					dataOut.userName = loginDTO.userName;  //pmModel.userName;
					dataOut.userPass = loginDTO.userPass; //pmModel.userPass;
					
					//20141210
					dataOut.user_id = data.result.qry.item.attribute("user_id").toString();   
					dataOut.idtipo =  data.result.qry.item.attribute("idtipo").toString();   
					dataOut.id_proveedor =  data.result.qry.item.attribute("id_proveedor").toString();   
					dataOut.idcliente =  data.result.qry.item.attribute("idcliente").toString();   
					//data.userValid=true;
					
					//20141018
					dataOut.language = loginDTO.language;
					
					
					response_message.data=dataOut;					
//					response_message.data= new User(); //TODO-> Setearle la data al user obj. //UserDTO_baja;
					
//					sendMessage(response_message); //-> El modulo/comp usuario debe estar escuchando x esta kte msge id 79! //(deleteRequestMessage); 
				//	dispatch(response_message);
					} 
				else if ( r == 0 ) {
					response_message = new EFlexEvent(Messages.LOGIN_DENIED_RESPONSE_MESSAGE); //("LOGIN_DENIED"); //new EMessage(Messages.LOGIN_DENIED_RESPONSE_MESSAGE); 
				//	dispatch(response_message);
					//sendMessage(response_message); //
				}
				else {
					//Logger.logError(LOG, error);  ojo, tmpoco loggear en todos los niveles, ver q conviene, sino logueo lo mismo mil veces
													// a menos q cada info de cada nivel de log sea de + especifica a mas abstracta osea <>s
													// y x lo tanto den <> tipo de info valiosa a cada nivel..
					//throw new Error("Error al obtener el resultado desde el servicio remoto");
					
					response_message = new EFlexEvent(Messages.LOGIN_FAIL_RESPONSE_MESSAGE);//("LOGIN_FAILED"); //new EMessage(Messages.LOGIN_FAIL_RESPONSE_MESSAGE); 
					
					//response_message.data= new String("Error al obtener el resultado desde el servicio remoto"); //TODO hacer algo + piola..
					
					//dispatch(response_message); //sendMessage(response_message); //
				}
				//dispatch(response_message);
			} 
			catch(error:Error) {
				Logger.logError(LOG, error); 
				//throw new Error(error.message);}
				//response_message = new EMessage(Messages.LOGIN_FAIL_RESPONSE_MESSAGE); 
				response_message = new EFlexEvent(Messages.LOGIN_FAIL_RESPONSE_MESSAGE); //("LOGIN_FAILED");
				//response_message.data= new String("Error al acceder o ejecutar el servicio remoto" + error.message); //TODO hacer algo + piola..
				
				//sendMessage(response_message); //
			}
			finally {
				//pru 20140530 : le seteo para q se dispare el evento a ver q pasa..
				// 20140723 : ANDA PERO ERA UN EJEMPLO. LO COMENTO:
				//pmModel.idDominio="003";
				
				try{
					//20140716 dispatch(response_message);
					pmModel.dispatchResultEvent(response_message);
				}catch(error2:Error) { 
					trace(error2.message); //tmp.. mejorar catch action..
				}
			}
		} 
		
		override public function fault(data:Object):void { //(dataXMLCollection:XMLListCollection):void {
			var evento:FaultEvent = data as FaultEvent;
			 
//			var response_message:IMessage;
//			//Alert.show(evento.fault.message,evento.fault.faultDetail);
//			
//			response_message = new EMessage(Messages.LOGIN_FAIL_RESPONSE_MESSAGE); 
//			
//			response_message.data= new String(evento.fault.faultDetail); //TODO hacer algo + piola..
//			
//			sendMessage(response_message); //
			 
			var response_message:Event;
			response_message = new Event(Messages.LOGIN_FAIL_RESPONSE_MESSAGE);
			dispatch(response_message);
		} 
		
		
		override public function completedParametersString():String {
			var loginDTO:LoginDTO= this.message.data as LoginDTO;
			return "&userName=" + loginDTO.userName + "&userPass=" + loginDTO.userPass;
		} 
		
		
		override public function get url():String { 
			var r:String=null;
			try {
				r = loginGlobalModel.loginUrl; // "http://localhost:8080/FMK-DynamicWEB/ServiceLocator?svc=login"; 
				//"http://localhost:8080/FMK-DynamicWEB/ServiceLocator?svc=login"; //20140828 model.servicios.login; 
				// <-- TODO : Sacar este hardCodeo, q sea seteable desde la app usuaria final!!!
			} 
			catch(error:Error) {
				trace(error.message);
			}
			finally{
				return r;				
			}
			
		}
	
	}	

}