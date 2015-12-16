require 'spec_helper'

RSpec.describe FilmCategory do
	it "保存影片导演" do
		fg_film_category_1 = build :film_category
		fg_film_category_2 = build :film_category
		film_categories = FilmCategory.llduang_save [fg_film_category_1.category, fg_film_category_2.category]
		expect([film_categories[0].category, film_categories[1].category]).to eq([fg_film_category_1.category, fg_film_category_2.category])
	end
end