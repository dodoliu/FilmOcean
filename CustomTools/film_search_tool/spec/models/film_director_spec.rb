require 'spec_helper'
require 'film_search_tool/models/film_director'

RSpec.describe FilmDirector do
	it "保存影片导演" do
		directors = %W(冯小刚 徐克)
		film_directors = FilmDirector.llduang_save directors
		expect([film_directors[0].director, film_directors[1].director]).to eq(['冯小刚', '徐克'])
	end
end