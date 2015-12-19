#encoding=utf-8

class FilmLogo < ActiveRecord::Base
	# belongs_to :film


	# protected
	#需要将图片上传到七牛CDN,地址使用七牛地址

	# def self.llduang_save(source, source_url)
	# 	film_source = FilmSource.find_by source: source, source_url: source_url
	# 	if film_source.blank?
	# 		film_source = FilmSource.create(source: source, source_url: source_url)
	# 	end
	# 	return film_source
	# end
end