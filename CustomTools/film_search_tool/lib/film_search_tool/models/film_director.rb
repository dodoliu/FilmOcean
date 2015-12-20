#encoding=utf-8

class FilmDirector < ActiveRecord::Base
	has_and_belongs_to_many :films

	protected
	def self.save(film, directors)
		directors.each do |item|
			film.film_directors.create(director: item)
		end
	end
end