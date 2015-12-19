require 'spec_helper'

RSpec.describe FilmArea do
	let(:film_area) { build :film_area}

	it "保存区域" do
		tmp_film_area = FilmArea.create area: film_area.area
		expect(tmp_film_area.area).to eq(film_area.area)
	end
end