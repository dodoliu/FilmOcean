require 'spec_helper'
require 'film_search_tool/models/film_introduction'

RSpec.describe FilmIntroduction do
	it "保存简介" do
		introduction = '这是简介哈哈'
		film_introduction = FilmIntroduction.llduang_save introduction
		expect(film_introduction.introduction).to eq(introduction)
	end
end