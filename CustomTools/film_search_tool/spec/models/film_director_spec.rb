require 'spec_helper'

RSpec.describe FilmDirector do
	it "保存影片导演" do
		fg_film_director_1 = build :film_director
		fg_film_director_2 = build :film_director
		film_directors = FilmDirector.llduang_save [fg_film_director_1.director, fg_film_director_2.director]
		expect([film_directors[0].director, film_directors[1].director]).to eq([fg_film_director_1.director, fg_film_director_2.director])
	end
end