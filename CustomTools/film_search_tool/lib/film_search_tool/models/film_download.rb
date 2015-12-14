#encoding=utf-8

=begin
Author: LDY
Date: 2015-11-29
Desc: 影片下载地址
=end

# module Model
# 	class FilmDownload
# 		#直接下载地址，非直接下载地址，扩展
# 		attr_accessor :download_url, :download_contact_url, :expand
# 	end
# end
class FilmDownload < ActiveRecord::Base

	#llduang
	def llduang_save(download_url, download_contact_url, expand)
		FilmDownload.create(download_url: download_url, download_contact_url: download_contact_url, expand: expand)
	end
end