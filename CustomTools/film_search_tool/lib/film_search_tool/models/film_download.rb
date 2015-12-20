#encoding=utf-8

class FilmDownload < ActiveRecord::Base

	protected
	def self.save(source,download_url, download_contact_url, download_other_url, expand)
		film_download = FilmDownload.find_by source: source, download_contact_url: download_contact_url
		if film_download.blank?
			film_download = FilmDownload.create(source: source, download_url: download_url, download_contact_url: download_contact_url, download_other_url: download_other_url, expand: expand)
		end
		return film_download
	end
end