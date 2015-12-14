require 'spec_helper'
require 'film_search_tool/models/film_actor'

RSpec.describe FilmActor do
	it "保存演员" do
		actors = %W(苍井空 波多野吉衣)
		film_actors = FilmActor.llduang_save actors
		expect([film_actors[0].actor, film_actors[1].actor]).to eq(actors)
	end
end