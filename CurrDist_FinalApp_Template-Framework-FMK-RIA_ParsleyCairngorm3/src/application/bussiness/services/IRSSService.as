package application.bussiness.services
{
	import mx.rpc.AsyncToken;

	public interface ILoginService
	{
		function recuperaRSS(url:String):AsyncToken
	}
}