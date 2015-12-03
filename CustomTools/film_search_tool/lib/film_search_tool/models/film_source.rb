#encoding=utf-8

=begin
Author：LDY
Date：2015-11-29
Desc：影片来源
=end

module Model
	class FilmSource
		attr_accessor :source, :source_url

		def set(url)
			@source = 'llduang'
			@source_url = url
		end
	end
end