require 'spec_helper'

RSpec.describe FilmDownload do
	let(:film_download){ build :film_download }
	it "保存下载地址" do
		tmp_film_download = FilmDownload.create(
		source: film_download.source,
		download_url: film_download.download_url,
		download_contact_url: film_download.download_contact_url,
		download_other_url: film_download.download_other_url,
		expand: film_download.expand)
	
		expect([tmp_film_download.source, tmp_film_download.download_url, tmp_film_download.download_contact_url, tmp_film_download.download_other_url, tmp_film_download.expand]).to eq([film_download.source, film_download.download_url, film_download.download_contact_url, film_download.download_other_url, film_download.expand])
	end
end