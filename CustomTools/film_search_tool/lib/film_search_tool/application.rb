#encoding=utf-8

require 'yaml'
require 'active_record'
require 'logger'

class Application
	#应用程序根目录路径
	$ROOTFILEPATH = File.dirname(__FILE__)

	#为了让测试环境正常运行，定义查找 application.yml的地址为不同的目录
	#spec查找 spce目录下面的config文件夹...想不到其它好的方式了。。。。
	$APPLICATION_YML_PATH = $APPLICATION_YML_PATH || ''
	if $APPLICATION_YML_PATH.empty?
		application_path = $ROOTFILEPATH + '/config/application.yml'
	else
		application_path = $APPLICATION_YML_PATH
	end
	application = YAML.load(File.open(application_path))

	#设置程序运行的环境，production,development,test
	$APPLICATIONENV = application["env"] || 'development'
	#设置程序使用的数据库
	$APPLICATIONDB = application["db"] || 'mysql'

	#log设置
	$LOGGER = Logger.new(application["logger_output"] || STDERR) 

	#数据库配置
	db_config_path = $ROOTFILEPATH + "/config/#{$APPLICATIONDB}.yml"
	db_config = YAML.load(File.open(db_config_path))
	ActiveRecord::Base.establish_connection(db_config["#{$APPLICATIONENV}"])

end