require 'spec_helper'
require 'film_search_tool/models/film_download'

RSpec.describe FilmDownload do
	it "保存下载地址" do
		download_url, download_contact_url, download_other_url, expand = 'http://bing.com', 'http://google.com', 'http://youtube.com', 'abcd'
		film_download = FilmDownload.llduang_save download_url, download_contact_url, download_other_url, expand
		expect([film_download.download_url, film_download.download_contact_url, film_download.download_other_url, film_download.expand]).to eq([download_url, download_contact_url, download_other_url, expand])
	end
end