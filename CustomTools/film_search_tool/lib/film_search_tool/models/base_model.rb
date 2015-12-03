RootFilePath = File.expand_path(File.join(File.dirname(__FILE__),'..'))
require RootFilePath + '/application'
require RootFilePath + '/helpers/mysql_helper'
require RootFilePath + '/helpers/postgresql_helper'

module Model
	class BaseModel < Application
		attr_accessor :client
		def initialize
			#初始化连接对象
			client_connection
		end

		private
		#默认连接的数据库
		def client_connection
			@client = Helper::Mysql.connection if $APPLICATIONDB == 'mysql'
			@client = Helper::PostgreSql.connection if $APPLICATIONDB == 'postgresql'
		end
	end
end