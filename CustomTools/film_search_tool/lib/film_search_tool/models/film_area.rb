#encoding=utf-8

=begin
Author: LDY
Date: 2015-11-29
Desc: 影片出品地区
=end

# module Model
# 	class FilmArea
# 		attr_accessor :area
# 	end
# end

class FilmArea < ActiveRecord::Base
	belongs_to :film

	protected
	def self.llduang_save(area)
		film_area = FilmArea.find_by area: area
		if film_area.blank?
			film_area = FilmArea.create(area: area)
		end
		return film_area
	end
end