require 'spec_helper'

RSpec.describe FilmTitle do
	let(:film_title) { build :film_title}
	it "保存影片名称" do
		tmp_film_title = FilmTitle.create(
			chinese_name: film_title.chinese_name,
			english_name: film_title.english_name)
		expect([tmp_film_title.chinese_name, tmp_film_title.english_name]).to eq([film_title.chinese_name, film_title.english_name])
	end
end