package framework.components.Login.Application.presentationModel
{
	import flash.events.Event;
	
	import framework.EMessage;
	import framework.EPMModel;
	import framework.IMainAppGlobalModel;
	import framework.Logger;
	import framework.components.Login.Application.bussiness.Entities.DTOs.LoginDTO;
	import framework.components.Login.Application.bussiness.commands.LoginCommand;
	import framework.components.Login.Application.domain.LoginGlobalModel;
	
	import mx.logging.ILogger;
	import mx.states.OverrideBase;

	public class MainScreenModel extends EPMModel {  
		private static const LOG:ILogger = Logger.getLogger(MainScreenModel);
		
		//ceg 20130728 : antes no referenciaba a la app ppal x q era un modulo indep pero ahora quiero saber q lenguage usar
		//ent podria usar el imainAppGlobalModel xa saber, pero si lo referencio quedo directamente acoplado! ent mejor lo 
		//recibo como parametro cuando la app usuaria me crea me tiene que pasar el curr language.. o sino 
		//como todavia no estoy logued in, x ahi deberia tener un xml o una kte de conf acá mismo interna en este modulo?
		// TODO .. -> POR AHORA HACER Q ME PASEN EL CURR LANG PERO COMO PARAM!! y meterlo en mi propio mainModel .. 
		// yo x q veo a este modulo como "especial"  (indep) .. pero abmPers, etc xa q sean totalmente reutiliables y desacoplados
		//tmpoco deberían refrenciar al modelo de la app ppal????????? pero sino como saben?? digamos, todo lo q tiene la app en mem?
		// x mensajeria? por parametro al ppio? x herencia de models ???!! mepa q esa ultima no? .. parsley era algo asi.. creo REVER!!
		
		
		//20141001 [Inject] No se injecta acá usando un IOC ccontainer (parsley) , ya lo setió ahora el mainscreen.xml
		[Bindable]	
		public var model:IMainAppGlobalModel; // <- New!: 20140803 ( METER en todos los modulos de gabriel etc tmb .. ) !!!!!!!!!!!!
		//public var model:LoginGlobalModel;
		
		//20141001 : AHORA NECESITO ESTOs models tmb (xa pasarselos al command y al service (httpservice)
		public var loginGlobalModel:LoginGlobalModel;
		
		//com ovveriding: -------------- ALLWAYS COPY THIS CODE (THIS 3 FUNCS MUST BE OVERRIDED )!!!!!!!!!!!! ---------------------------------
	
		override public function getMainAppModel():IMainAppGlobalModel {
			return this.model; // OJO!! Sabes recien q se injectó el modelo y q podes usarlo en el [init]!!! asi q como 
		}					   // todo este algoritmo abstracto xa cargar el lenguaje inicia en el constructor (new) de la clase (invocando este
							   // al del padre!!) (*) !! ASI Q NO SIRVE!!!!!!!!!!! 
		
		//ent:	SOLUCION! -> el code no inicia mas en el const del epmmodel padre abstracto sino q inicia acá en el init y se encapsula
							//todo el code q estaba en el constructor en una unica func wrapper en epmmodel q es invocada desde aca desde
							// el init donde ya sé q el model está injectado!!
		
		//20141001 , este codigo se debe ejecutar al ppio y solo hace loadLanguage() (xero necesita el globalModel ya seteado !!) asi que:
		/*[Init]		//la saco y llamo en mainscreen explícitamente a la func loadlanguage (q es public!) y listo (asy syncronizo y safo)
		public function handleInit():void {
			try {
				loadLanguage();
			} 
			catch(error:Error)  {
				throw new Error(error.messag);			
			}
		} */
		
		override public function getModuleName():String { 
			var strTmp:String=null;
			try {
				strTmp="Login";
			} 
			catch(error:Error)  {
				throw new Error(error.message);
			}finally {
				return strTmp;
			}
		}
		
	
		
		//fin ovveriding: -------------- ALLWAYS COPY THIS CODE (THIS 3 FUNCS MUST BE OVERRIDED )!!!!!!!!!!!! ---------------------------------
		
		//20141018 : ESTE SIGUIENTE OVEERIDE NO ES OBLIGATORIO, PERO xomo estoy dentro de la lib swc (dentro del 
		//			 framework) , entonces debo hacerlo :
		public override function getFileLanguageUri(strCurrLang:String):String { //ceg 20140728 ..override if needed..
			var strUri:String="";
			try {
				//ceg 20140728 ..default implementation: tomo el currlanguage var value de la app global model.. override if needed ..!
				//strUri =  "./framework/components/" + getModuleName() + "/Application/presentationModel/languages/" + getClassName() + "_" + strCurrLang + ".xml"; 
				strUri  = getClassName() + "_" + strCurrLang + ".xml";
				//				strUri = "Modules/" + getModuleName() + "/Application/presentationModel/languages/" + getDefinitionByName(getQualifiedClassName(this)).toString() + "_" + strCurrLang + ".xml"; 
				
			} 
			catch(error:Error) {
				throw Error( "error getting language uri" + error.message  ) ;
			}finally {
				return strUri;
			}
		}
		
		//y pruebo con esto ademas tmb:
		public var xmlLangModelSpanish:XML=  <root>
					<qry>
						<item name="lblUserName" 	value="Usuario: "	/>
						<item name="lblUserPass" 	value="Contraseña: "/>
						<item name="lblcmbLanguage" value="Idioma: "	/>
						<item name="legendFieldSet"	value="Ingreso al Sistema 4PL: "/>
					</qry>
					</root>;
							
		public var xmlLangModelEnglish:XML= <root>
					<qry>
						<item name="lblUserName" 		value="User: "	/>
						<item name="lblUserPass" 		value="Password: "/>
						<item name="lblcmbLanguage"	 	value="Idiom: "/>
						<item name="legendFieldSet"	 	value="4PL System Login: "/>
					</qry>
					</root>;
		
		// -----------------------------------------------------------------------------------------------------------		
		
		[Bindable]
		public var userName:String="";
		
		[Bindable]
		public var userPass:String="";

		//20141018
		//private var _idDominio:String="";
		
		[Bindable]
		private var _idLanguage:String=""; //"ES"/"EN" (fmk_constants)

		//20141018
		//public function set idDominio(value:String):void {
		public function set idLanguage(value:String):void {	
			_idLanguage = value;
			dispatchEventForComboSelItemUpdate("cmbLanguage",_idLanguage);
		}

		//20140308: labels y mensajes ( todo lo relacionado con la UI):
		[Bindable]
		public var lblUserName:String="";
		
		[Bindable]
		public var lblUserPass:String="";
		
		//20141018
		//[Bindable]
		//public var lblDomain:String="";
		
		[Bindable]
		public var lblcmbLanguage:String="";
		
		//20141018
		[Bindable]
		public var legendFieldSet:String="";
		
		//20141001 : saqué parsley...
		/*[MessageDispatcher]
		public var sendMessage:Function;  
		
		public  function sendLoginRequestMSG(typeParam:int, loginDTOParam:LoginDTO):void {
			var loginRequestMessage:EMessage; //LoginRequestMessage;
			
			try{
				loginRequestMessage = new EMessage(typeParam); // LoginRequestMessage(typeParam);//(LoginRequestMessage.LOGIN_REQUEST_MESSAGE);
				loginRequestMessage.data=loginDTOParam;
				
				//loginRequestMessage.subtype=EMessage.CONSULTA; // ALTA; 
				
				sendMessage(loginRequestMessage); 	
			}
			catch (error:Error) {
				Logger.logError(LOG, error); 
				throw new Error(error.message); 
			}
			finally {
				
			}

		}*/ 
		//20141001 : y la re-escribo distinta (antes tiraba a traves de parsley un evt/msge y parsley mediante hasmap de conf suyo 
		//			asociaba (gracias a mi conf.mxml de este modulo) a ese msge/evt la clase (command) a ejecutarle el .execute()
		//			AHORA en vez de tirar evento invoco en forma directa al command (se vé q es + acoplado q c/evts e/capas xero safo)!
		public  function sendLoginRequestMSG(typeParam:int, loginDTOParam:LoginDTO):void {
			var loginRequestMessage:EMessage; //LoginRequestMessage;
			
			try{
				/*
				loginRequestMessage = new EMessage(typeParam); // LoginRequestMessage(typeParam);//(LoginRequestMessage.LOGIN_REQUEST_MESSAGE);
				loginRequestMessage.data=loginDTOParam;
				//loginRequestMessage.subtype=EMessage.CONSULTA; // ALTA; 
				sendMessage(loginRequestMessage); 	*/
			
				//a) Cmd conf:
				var loginCmd:LoginCommand = new LoginCommand;
				loginCmd.loginGlobalModel=this.loginGlobalModel;
				loginCmd.pmModel=this;
				//a) Cmd execution: ( no message ioc mecanhism )
				loginRequestMessage = new EMessage(typeParam);
				loginRequestMessage.data=loginDTOParam;
				loginCmd.execute(loginRequestMessage); //EXPLICITAMENTE! 
			}
			catch (error:Error) {
				Logger.logError(LOG, error); 
				throw new Error(error.message); 
			}
			finally {
				
			}
			
		}
		
		//20140716
		public function dispatchResultEvent(evt:Event):void{
			try {
				dispatchEvent(evt);	
			} 
			catch(error:Error)  {
				throw new Error(error.message);
			}
			
		}
		
		public function MainScreenModel(){
			//	super(); // NO , ya no va mas esto esto -> tiene q ejecutar el code del EPMmodel padre!.. (*) !! 
		}
	
	} 
	
}