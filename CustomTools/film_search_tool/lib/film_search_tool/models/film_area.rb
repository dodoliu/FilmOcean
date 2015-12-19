#encoding=utf-8

class FilmArea < ActiveRecord::Base
	# belongs_to :film

	# protected
	# def self.llduang_save(area)
	# 	film_area = FilmArea.find_by area: area
	# 	if film_area.blank?
	# 		film_area = FilmArea.create(area: area)
	# 	end
	# 	return film_area
	# end
end