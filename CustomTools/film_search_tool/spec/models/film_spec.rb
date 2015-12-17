require 'spec_helper'

RSpec.describe Film do

	before :each do
		@fg_film_tilte = create :film_title
		@fg_film_logo = create :film_logo
		@fg_film_area = create :film_area
		@fg_film_introduction = create :film_introduction
		@fg_film_download = create :film_download
		@fg_film_director = create :film_director
		@fg_film_category = create :film_category
		@fg_film_actor = create :film_actor
	end

	it "保存影片信息" do
		film = Film.llduang_save(@fg_film_tilte.chinese_name, @fg_film_tilte.english_name,
			@fg_film_tilte.id, @fg_film_logo.id, @fg_film_area.id, @fg_film_introduction.id,
			1,'2015-12-17', 3, 666, 6.5, '120分钟')
		expect([film.chinese_name, film.english_name]).to eq([@fg_film_tilte.chinese_name, @fg_film_tilte.english_name])
	end

	#删除刚创建的数据
	after :each do
		DatabaseCleaner.clean
	end
end