#encoding=utf-8

class FilmCategory < ActiveRecord::Base
	has_and_belongs_to_many :films

	protected
	def self.save(film, categories)
		categories.each do |item|
			film.film_categories.create(category: item)
		end
	end
end