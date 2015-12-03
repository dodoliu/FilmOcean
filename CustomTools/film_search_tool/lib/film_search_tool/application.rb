#encoding=utf-8

=begin
Author: LDY
Date: 2015-12-3
Desc: 程序启动时，加载通用配置
=end
require 'yaml'

class Application

	#应用程序根目录路径
	$ROOTFILEPATH = File.dirname(__FILE__)

	application_path = $ROOTFILEPATH + '/config/application.yml'
	application = YAML.load(File.open(application_path))

	#设置程序运行的环境，production,development,test
	$APPLICATIONENV = application["env"]
	#设置程序使用的数据库
	$APPLICATIONDB = application["db"]
end
