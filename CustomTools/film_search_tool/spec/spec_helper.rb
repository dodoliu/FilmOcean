#这个 APPLICATION_YML_PATH 常量的目的是让spec查找spec文件夹下的config文件下的application.yml文件
$APPLICATION_YML_PATH = File.dirname(__FILE__) + '/config/application.yml'
require 'rspec'
require 'film_search_tool/application'

RSpec.configure do |config|
end