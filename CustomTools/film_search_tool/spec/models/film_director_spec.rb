require 'spec_helper'

RSpec.describe FilmDirector do
	let(:film_director) { build :film_director }
	it "保存影片导演" do
		tmp_film_director = FilmDirector.create director: film_director.director
		expect(tmp_film_director.director).to eq(film_director.director)
	end
end