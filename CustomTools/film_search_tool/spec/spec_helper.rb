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

RSpec.configure do |config|
	#配置FactoryGirl
	config.include FactoryGirl::Syntax::Methods

	#设置DatabaseCleaner能顺利清空测试数据
	config.before(:suite) do
       DatabaseCleaner.strategy = :transaction #, {:except => %w[widgets]}
       DatabaseCleaner.clean_with(:truncation)
	end
	config.before(:each) do
		DatabaseCleaner.start
	end
	config.after(:each) do
		DatabaseCleaner.clean
	end
end

#加载一些通用配置
require 'film_search_tool/config/config' 
