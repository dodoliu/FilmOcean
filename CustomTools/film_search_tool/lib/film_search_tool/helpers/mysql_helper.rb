# require 'mysql2'
# require File.expand_path(File.join(File.dirname(__FILE__),'..')) + '/application'

# module Helper
# 	class Mysql < Application
# 		#mysql配置的几个基本属性
# 		attr_accessor :host, :username, :password, :encoding, :pool, :database
# 		#mysql连接方法
# 		def self.connection
# 			case $APPLICATIONENV
# 			when 'production'
# 				set_db_config 'production'
# 			when 'development'
# 				set_db_config 'development'
# 			when 'test'
# 				set_db_config 'test'
# 			else
# 				set_db_config 'development'
# 			end

# 			#连接mysql数据库
# 			Mysql2::Client.new(
# 				:host => @host,
# 				:username => @username,
# 				:password => @password,
# 				:encoding => @encoding,
# 				:pool => @pool,
# 				:database => @database
# 				)
# 		end

# 		private
# 		#设置mysql的基本配置
# 		def self.set_db_config(type)
# 			db_path = $ROOTFILEPATH + '/config/mysql.yml'
# 			db = YAML.load(File.open(db_path))

# 			@host = db["#{type}"]["host"] || 'localhost'
# 			@username = db["#{type}"]["username"] || 'root'
# 			@password = db["#{type}"]["password"] || ''
# 			@encoding = db["#{type}"]["encoding"] || 'utf8'
# 			@pool = db["#{type}"]["pool"] || 5
# 			@database = db["#{type}"]["database"] || 'film_ocean_development'
# 		end
# 	end
# end