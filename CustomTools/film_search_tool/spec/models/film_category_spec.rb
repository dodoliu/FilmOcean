require 'spec_helper'

RSpec.describe FilmCategory do
	let(:film_category) { build :film_category }

	it "保存影片导演" do
		tmp_film_category = FilmCategory.create category: film_category.category
		expect(tmp_film_category.category).to eq(film_category.category)
	end
end