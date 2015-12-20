#encoding=utf-8

class FilmLogo < ActiveRecord::Base

	protected
	#需要将图片上传到七牛CDN,地址使用七牛地址

	def self.save(logo_url)
		film_logo = FilmLogo.find_by logo_url: logo_url
		if film_logo.blank?
			film_logo = FilmLogo.create(logo_url: logo_url)
		end
		return film_logo
	end
end