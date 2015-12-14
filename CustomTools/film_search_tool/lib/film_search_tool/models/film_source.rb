#encoding=utf-8

class FilmSource < ActiveRecord::Base

	protected
	def self.llduang_save(source, source_url)
		film_source = FilmSource.find_by source: source, source_url: source_url
		if film_source.blank?
			film_source = FilmSource.create(source: source, source_url: source_url)
		end
		return film_source
	end
end

