#encoding=utf-8

class FilmTitle < ActiveRecord::Base

	protected
	#获取名称
	def self.save(c_name, e_name)
		film_title = FilmTitle.find_by chinese_name: c_name, english_name: e_name
		if film_title.blank?
			film_title = FilmTitle.create(chinese_name: c_name, english_name: e_name)
		end
		return film_title
	end
end
