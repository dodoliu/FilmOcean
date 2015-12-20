#encoding=utf-8

class FilmActor < ActiveRecord::Base
	has_and_belongs_to_many :films

	protected
	def self.save(film, actors)
		actors.each do |item|
			film.film_actors.create(actor: item)
		end
	end
end