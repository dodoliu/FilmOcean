#encoding=utf-8

class FilmDirector < ActiveRecord::Base

	protected
	def self.llduang_save(directors)
		#查不存在的记录,返回所有对象
		film_directors = []
		directors.each do |item|
			director = FilmDirector.find_by director: item
			if director.blank?
				director = FilmDirector.create director: item
			end
			film_directors.push director
		end
		return film_directors
	end
end