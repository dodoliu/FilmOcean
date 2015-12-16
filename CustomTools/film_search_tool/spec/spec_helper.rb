#这个 APPLICATION_YML_PATH 常量的目的是让spec查找spec文件夹下的config文件下的application.yml文件
$APPLICATION_YML_PATH = File.dirname(__FILE__) + '/config/application.yml'
require 'rspec'
require 'film_search_tool/application'
require 'factory_girl'

#models
require 'film_search_tool/models/film'
require 'film_search_tool/models/film_title'
require 'film_search_tool/models/film_source'
require 'film_search_tool/models/film_logo'
require 'film_search_tool/models/film_introduction'
require 'film_search_tool/models/film_download'
require 'film_search_tool/models/film_director'
require 'film_search_tool/models/film_category'
require 'film_search_tool/models/film_area'
require 'film_search_tool/models/film_actor'

#FactoryGirl
require 'factories/film_titles'
require 'factories/film_sources'
require 'factories/film_logos'
require 'factories/film_introductions'
require 'factories/film_downloads'
require 'factories/film_directors'
require 'factories/film_categories'
require 'factories/film_areas'
require 'factories/film_actors'

RSpec.configure do |config|
	config.include FactoryGirl::Syntax::Methods
end