#encoding=utf-8

class FilmActor < ActiveRecord::Base
	has_and_belongs_to_many :films

	# protected
	# def self.llduang_save(actors)
	# 	#查不存在的记录,返回所有对象
	# 	film_actors = []
	# 	actors.each do |item|
	# 		category = FilmActor.find_by actor: item
	# 		if category.blank?
	# 			category = FilmActor.create actor: item
	# 		end
	# 		film_actors.push category
	# 	end
	# 	return film_actors
	# end
end