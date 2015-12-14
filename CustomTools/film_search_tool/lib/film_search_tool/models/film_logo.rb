#encoding=utf-8

=begin
Author：LDY
Date：2015-11-29
Desc：影片logo
=end

# module Model
# 	class FilmLogo
# 		attr_accessor :logo_url
# 	end
# end

class FilmLogo < ActiveRecord::Base


	protected
	#需要将图片上传到七牛CDN,地址使用七牛地址

	# def self.llduang_save(source, source_url)
	# 	film_source = FilmSource.find_by source: source, source_url: source_url
	# 	if film_source.blank?
	# 		film_source = FilmSource.create(source: source, source_url: source_url)
	# 	end
	# 	return film_source
	# end
end