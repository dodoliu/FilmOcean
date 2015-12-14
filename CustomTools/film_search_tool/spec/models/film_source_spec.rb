require 'spec_helper'
require 'film_search_tool/models/film_source'

RSpec.describe FilmSource do
	it "保存来源" do
		source, source_url = 'llduang', 'http://www.llduang.com/'

		film_source = FilmSource.llduang_save source,source_url
		expect([film_source.source, film_source.source_url]).to eq([source, source_url])
	end
end