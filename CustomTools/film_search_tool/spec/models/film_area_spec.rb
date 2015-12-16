require 'spec_helper'

RSpec.describe FilmArea do
	it "保存区域" do
		fg_film_area = build :film_area
		film_area = FilmArea.llduang_save fg_film_area.area
		expect(film_area.area).to eq(fg_film_area.area)
	end
end