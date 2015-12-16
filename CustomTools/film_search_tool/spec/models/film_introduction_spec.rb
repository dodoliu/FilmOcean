require 'spec_helper'

RSpec.describe FilmIntroduction do
	it "保存简介" do
		fg_film_introduction = build :film_introduction
		film_introduction = FilmIntroduction.llduang_save fg_film_introduction.introduction
		expect(film_introduction.introduction).to eq(fg_film_introduction.introduction)
	end
end