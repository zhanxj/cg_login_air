package utils
{
	import flash.desktop.NativeApplication;
	import flash.desktop.NativeProcess;
	import flash.desktop.NativeProcessStartupInfo;
	import flash.filesystem.File;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;

	public class CommonUtil
	{
		public function CommonUtil()
		{
		}
		public static function callexe(exePath:String):void
		{
			NativeApplication.nativeApplication.autoExit=true;
			var cmdFile:File=new File();
			cmdFile=cmdFile.resolvePath(exePath);
			var nativeProcessStartupInfo:NativeProcessStartupInfo=new NativeProcessStartupInfo();
			nativeProcessStartupInfo.executable=cmdFile;
			var process:NativeProcess=new NativeProcess();
			process.start(nativeProcessStartupInfo);
		}
		
		public static function callUrl(url:String):void
		{
			var urlReq:URLRequest=new URLRequest(url);
			navigateToURL(urlReq);
		}
		
	}
}