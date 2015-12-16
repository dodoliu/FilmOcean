require 'spec_helper'

RSpec.describe FilmSource do
	it "保存来源" do
		fg_film_source = build :film_source
		film_source = FilmSource.llduang_save fg_film_source.source, fg_film_source.source_url
		expect([film_source.source, film_source.source_url]).to eq([fg_film_source.source, fg_film_source.source_url])
	end
end