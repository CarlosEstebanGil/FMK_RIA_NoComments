package framework.components.Login.data.conf
{
	public class Messages {
		//la kte login request msge es solo xa uso interno del modulo q tmb funciona en capas:
		public static const LOGIN_REQUEST_MESSAGE:int =79; //lo dejo acá x la conf.mxml xa parsley , de fuera del mod puedo tomarlo de aca.
		
		/* Los msges de rta NO van a ser parsley, sino events flex comunes cuyo type espera ser un String 
		// -- ctes xa demás modulos o compnentes usuarios ( rtas ):
		public static const LOGIN_GRANTED_RESPONSE_MESSAGE:int =80;
		public static const LOGIN_DENIED_RESPONSE_MESSAGE:int =81;
		
		public static const LOGIN_FAIL_RESPONSE_MESSAGE:int =81;
		//-- 
		
		Entonces: */
		public static const LOGIN_GRANTED_RESPONSE_MESSAGE:String="LOGIN_GRANTED";
		public static const LOGIN_DENIED_RESPONSE_MESSAGE:String="LOGIN_DENIED";
		
		public static const LOGIN_FAIL_RESPONSE_MESSAGE:String ="LOGIN_FAILED";
		
		//demas msges del modulo.. 
	}
}