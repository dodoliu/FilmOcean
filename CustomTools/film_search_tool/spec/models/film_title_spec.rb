require 'spec_helper'

RSpec.describe FilmTitle do
	it "保存影片名称" do
		fg_film_title = build(:film_title)
		film_title = FilmTitle.llduang_save fg_film_title.chinese_name, fg_film_title.english_name
		expect([film_title.chinese_name, film_title.english_name]).to eq([fg_film_title.chinese_name, fg_film_title.english_name])
	end
end