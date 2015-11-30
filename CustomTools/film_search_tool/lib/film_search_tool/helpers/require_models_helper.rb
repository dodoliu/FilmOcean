#encoding=utf-8

=begin
Author: LDY
Date: 2015-11-29
Desc: 引入所有的model
=end

HelperDirPath = File.expand_path(File.join(File.dirname(__FILE__),'..'))
require HelperDirPath + '/models/film'
require HelperDirPath + '/models/film_actor'
require HelperDirPath + '/models/film_area'
require HelperDirPath + '/models/film_category'
require HelperDirPath + '/models/film_director'
require HelperDirPath + '/models/film_download'
require HelperDirPath + '/models/film_introduction'
require HelperDirPath + '/models/film_logo'
require HelperDirPath + '/models/film_source'
require HelperDirPath + '/models/film_title'