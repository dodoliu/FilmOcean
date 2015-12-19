require 'spec_helper'

RSpec.describe FilmIntroduction do
	let(:film_introduction) { build :film_introduction }
	it "保存简介" do
		tmp_film_introduction = FilmIntroduction.create introduction: film_introduction.introduction
		expect(tmp_film_introduction.introduction).to eq(film_introduction.introduction)
	end
end