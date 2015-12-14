require 'spec_helper'
require 'film_search_tool/models/film_title'

RSpec.describe FilmTitle do
	it "验证影片名称" do
		c_name, e_name = '夏洛特烦恼', 'Goodbye Mr. Loser'
		film_title = FilmTitle.llduang_save c_name, e_name
		expect(film_title.chinese_name).to eq(c_name)
	end
end