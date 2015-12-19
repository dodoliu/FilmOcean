#encoding=utf-8

class FilmCategory < ActiveRecord::Base
	has_and_belongs_to_many :films

	# protected
	# def self.llduang_save(categories)
	# 	#查不存在的记录,返回所有对象
	# 	film_categories = []
	# 	categories.each do |item|
	# 		category = FilmCategory.find_by category: item
	# 		if category.blank?
	# 			category = FilmCategory.create category: item
	# 		end
	# 		film_categories.push category
	# 	end
	# 	return film_categories
	# end
end