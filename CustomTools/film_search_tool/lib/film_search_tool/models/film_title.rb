#encoding=utf-8

class FilmTitle < ActiveRecord::Base
	has_one :film

	protected

	#服务于llduang
	#获取名称
	def self.llduang_save(c_name, e_name)
		film_title = FilmTitle.find_by chinese_name: c_name, english_name: e_name
		if film_title.blank?
			film_title = FilmTitle.create(chinese_name: c_name, english_name: e_name)
		end
		return film_title
	end
end
