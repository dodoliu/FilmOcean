#encoding=utf-8

=begin
Author: LDY
Date: 2015-11-29
Desc: 影片对象
=end

# module Model
# 	class Film
# 		attr_accessor :film_title, :film_logo, :film_area, :film_director, :film_category
# 	end
# end

class Film < ActiveRecord::Base
	# has_one: film_title
	# has_one: film_logo
	# has_one: film_area
	# has_many: film_directors #多个导演
	# has_many: film_categories
	# has_one: film_introductions
	# has_many: film_sources #多个来源
	# has_many: film_downloads #多个下载地址
	# has_many: film_actors #多个演员

end
