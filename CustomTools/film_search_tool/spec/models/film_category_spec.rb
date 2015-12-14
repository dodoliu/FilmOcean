require 'spec_helper'
require 'film_search_tool/models/film_category'

RSpec.describe FilmCategory do
	it "保存影片导演" do
		categories = %W(传记 伦理)
		film_categories = FilmCategory.llduang_save categories
		expect([film_categories[0].category, film_categories[1].category]).to eq(['传记', '伦理'])
	end
end