#这个 APPLICATION_YML_PATH 常量的目的是让spec查找spec文件夹下的config文件下的application.yml文件
$APPLICATION_YML_PATH = File.dirname(__FILE__) + '/config/application.yml'
require 'rspec'
require 'film_search_tool/application'
require 'factory_girl'
require 'database_cleaner'
require 'qiniu'

#models
require 'film_search_tool/models/film'
require 'film_search_tool/models/film_title'
require 'film_search_tool/models/film_logo'
require 'film_search_tool/models/film_introduction'
require 'film_search_tool/models/film_download'
require 'film_search_tool/models/film_director'
require 'film_search_tool/models/film_category'
require 'film_search_tool/models/film_area'
require 'film_search_tool/models/film_actor'

#FactoryGirl
require 'factories/film_titles'
require 'factories/film_logos'
require 'factories/film_introductions'
require 'factories/film_downloads'
require 'factories/film_directors'
require 'factories/film_categories'
require 'factories/film_areas'
require 'factories/film_actors'

	# #数据库配置
	# db_config_path = $ROOTFILEPATH + "/config/#{$APPLICATIONDB}.yml"
	# db_config = YAML.load(File.open(db_config_path))
	# ActiveRecord::Base.establish_connection(db_config["#{$APPLICATIONENV}"])


RSpec.configure do |config|
	#配置FactoryGirl
	config.include FactoryGirl::Syntax::Methods
end

#配置DatabaseCleaner
DatabaseCleaner.strategy = :truncation

#配置七牛云存储
Qiniu.establish_connection! :access_key => 'SvDYpGHkXMlUnm4RsdE6iOLzaGRcyey5vdVsycPD',
                            :secret_key => 'PgQhg_8PkT0Jlnucsz0WFa2xfaiiss1jSjtYUCda'
