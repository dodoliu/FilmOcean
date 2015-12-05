class Film < ActiveRecord::Base
	has_one: film_title
	has_one: film_logos
	has_one: film_areas
	has_many: film_directors #多个导演
	has_many: film_categories
	has_one: film_introductions
	has_many: film_sources #多个来源
	has_many: film_downloads #多个下载地址
	has_many: film_actors #多个演员
end
