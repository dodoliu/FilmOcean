require 'spec_helper'

RSpec.describe Film do

	let(:film_title) { create :film_title }
	let(:film_title_2) { build :film_title }
	let(:film_logo) { create :film_logo }
	let(:film_logo_2) { build :film_logo }
	let(:film_area) { create :film_area }
	let(:film_area_2) { build :film_area }
	let(:film_introduction) { create :film_introduction }
	let(:film_introduction_2) { build :film_introduction }
	let(:film_download) { create :film_download }
	let(:film_director) { build :film_director }
	let(:film_category) { build :film_category }
	let(:film_actor) { build :film_actor }

	it "保存影片信息" do
		film = Film.create(
			chinese_name: film_title.chinese_name,
			english_name: film_title.english_name,
			film_title_id: film_title.id,
			film_logo_id: film_logo.id,
			film_area_id: film_area.id,
			film_introduction_id: film_introduction.id,
			film_language: 1,
			make_date: '2015-12-17',
			show_type: 3,
			click_rate: 666,
			grade: 6.5,
			duration: '120分钟')
		expect([film.chinese_name, film.english_name]).to eq([film_title.chinese_name, film_title.english_name])

		#与演员的关系
		film.film_actors.create(actor: film_actor.actor)
		expect(film.film_actors[0].actor).to eq(film_actor.actor)

		#与分类的关系
		film.film_categories.create(category: film_category.category)
		expect(film.film_categories[0].category).to eq(film_category.category)

		#与导演的关系
		film.film_directors.create(director: film_director.director)
		expect(film.film_directors[0].director).to eq(film_director.director)

		#与下载地址的关系
		film.film_downloads.create(
			source: film_download.source,
			download_url: film_download.download_url,
			download_contact_url: film_download.download_contact_url,
			expand: film_download.expand)
		expect(film.film_downloads[0].download_url).to eq(film_download.download_url)

		#与名称的关系
		film.create_film_title(
			chinese_name: film_title_2.chinese_name,
			english_name: film_title_2.english_name)
		expect(film.film_title.english_name).to eq(film_title_2.english_name)

		#与logo的关系
		film.create_film_logo(
			logo_url: film_logo_2.logo_url)
		expect(film.film_logo.logo_url).to eq(film_logo_2.logo_url)

		#与区域的关系
		film.create_film_area(
			area: film_area_2.area)
		expect(film.film_area.area).to eq(film_area_2.area)

		#与简介的关系
		film.create_film_introduction(
			introduction: film_introduction_2.introduction)
		expect(film.film_introduction.introduction).to eq(film_introduction_2.introduction)
	end

	# it 'film的事务测试' do
	# 	Film.transaction do
			
	# 	end
	# end
end