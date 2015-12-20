#encoding=utf-8

class FilmIntroduction < ActiveRecord::Base

	protected
	def self.save(introduction)
		film_introduction = FilmIntroduction.find_by introduction: introduction
		if film_introduction.blank?
			film_introduction = FilmIntroduction.create(introduction: introduction)
		end
		return film_introduction
	end
end