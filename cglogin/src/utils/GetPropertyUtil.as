package utils
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	import mx.controls.Alert;
	import mx.utils.StringUtil;

	public class GetPropertyUtil
	{
		public function GetPropertyUtil()
		{
		}
		public  static  const REGIST_URL:String="regist_url"; //注册
		public  static  const GETPASSWORD_URL:String="getpassword_url"; //找回密码
		public static const BBS_URL:String="bbs_url";
		private static  const configPath:String =File.applicationDirectory.nativePath + "\\config.txt";
		public static function getProperty(key:String):String
		{
			var resultString:String = new String();
			var content:String =getFileContent(configPath);
			var properties:Array = content.split("\r");
			for each (var pro:String in properties) 
			{
				var keys:Array =pro.split("@=");
				if(keys.length!=2)
				{
					Alert.show("config.txt 文件格式不对。请重新下载登录器。");
					return "";
				}
				var t_key:String =StringUtil.trim(keys[0]);
				if(t_key==key)
				{
					resultString =StringUtil.trim(keys[1]);
				}
				
			}
			return resultString;
		}
		
		public static function getFileContent(path:String):String
		{
			var resultString:String = new String();
			var file:File = new File(path);
			if(!file.exists)
			{
				Alert.show(path+" 文件不存在。请重新下载登录器。");
				return "";
			}
			var stream:FileStream = new FileStream();    //创建FileStream对象
			stream.open(file,FileMode.READ);    //使用FileStream对象以只读方式打开File对象
			var content:String = stream.readUTFBytes(stream.bytesAvailable);
			stream.close();    //关闭FileStream对象
			return content;
		}
	}
}
