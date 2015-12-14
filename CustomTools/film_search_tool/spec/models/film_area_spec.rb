require 'spec_helper'
require 'film_search_tool/models/film_area'

RSpec.describe FilmArea do
	it "保存区域" do
		area = '中国大陆'
		film_area = FilmArea.llduang_save area
		expect(film_area.area).to eq(area)
	end
end