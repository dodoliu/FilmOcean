require 'spec_helper'

RSpec.describe Film do

	#保证测试用例失败后也删除新插入的数据
	def destroy_data_for_rescue
		p @fg_film_tilte
		p @fg_film_logo
		FilmTitle.find(@fg_film_tilte.id).destroy

		FilmLogo.find(@fg_film_logo.id).destroy
		FilmIntroduction.find(@fg_film_introduction.id).destroy

		FilmDownload.find(@fg_film_download.id).destroy
		FilmDirector.find(@fg_film_director.id).destroy

		FilmCategory.find(@fg_film_category.id).destroy
		FilmArea.find(@fg_film_area.id).destroy
		FilmActor.find(@fg_film_actor.id).destroy
	end

	before :each do
		begin
			@fg_film_tilte = create :film_title
			@fg_film_logo = create :film_logo
			@fg_film_introduction = create :film_introduction
			@fg_film_download = create :film_download
			@fg_film_director = create :film_director
			@fg_film_category = create :film_category
			@fg_film_area = create :film_area
			@fg_film_actor = create :film_actor
		rescue
			p 1
			destroy_data_for_rescue
		end
	end

	it "保存影片信息" do
 
		# p @fg_film_tilte.chinese_name
 
	end

	#删除刚创建的数据
	after :each do
		p 2
		destroy_data_for_rescue
	end
end