#encoding=utf-8

class Film < ActiveRecord::Base
	# has_one: film_title
	# has_one: film_logo
	# has_one: film_area
	# has_many: film_directors #多个导演
	# has_many: film_categories
	# has_one: film_introductions
	# has_many: film_downloads #多个下载地址
	# has_many: film_actors #多个演员

	has_and_belongs_to_many :film_categories
	has_and_belongs_to_many :film_directors
	has_and_belongs_to_many :film_actors
	has_many :film_downloads
	# has_one :film_title


	# protected
	# def self.llduang_save(source, source_url)
	# 	film_source = FilmSource.find_by source: source, source_url: source_url
	# 	if film_source.blank?
	# 		film_source = FilmSource.create(source: source, source_url: source_url)
	# 	end
	# 	return film_source
	# end

end
