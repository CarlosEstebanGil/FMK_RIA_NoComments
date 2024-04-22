package framework.components.Login.Application.bussiness.services
{
	import mx.rpc.AsyncToken;

	public interface ILoginService
	{
	  function login(url:String):AsyncToken //tmp: luego sacar la url de aca. tenerlas en el globalModel?
	}
}