require 'spec_helper'

RSpec.describe FilmDownload do
	it "保存下载地址" do
		fg_film_download = build :film_download
		film_download = FilmDownload.llduang_save fg_film_download.source, fg_film_download.download_url, fg_film_download.download_contact_url, fg_film_download.download_other_url, fg_film_download.expand
		expect([film_download.source, film_download.download_url, film_download.download_contact_url, film_download.download_other_url, film_download.expand]).to eq([fg_film_download.source, fg_film_download.download_url, fg_film_download.download_contact_url, fg_film_download.download_other_url, fg_film_download.expand])
	end
end