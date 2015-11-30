#encoding=utf8

=begin
Author: LDY
Date: 2015-11-29
Desc: 引入所有的model
=end

HelperDirPath = File.expand_path(File.join(File.dirname(__FILE__),'..'))
require HelperDirPath + '/models/film.rb'
require HelperDirPath + '/models/film_actor.rb'
require HelperDirPath + '/models/film_area.rb'
require HelperDirPath + '/models/film_category.rb'
require HelperDirPath + '/models/film_director.rb'
require HelperDirPath + '/models/film_download.rb'
require HelperDirPath + '/models/film_introduction.rb'
require HelperDirPath + '/models/film_logo.rb'
require HelperDirPath + '/models/film_source.rb'
require HelperDirPath + '/models/film_title.rb'