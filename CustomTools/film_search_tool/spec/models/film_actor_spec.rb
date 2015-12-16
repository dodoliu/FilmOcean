require 'spec_helper'

RSpec.describe FilmActor do
	it "保存演员" do
		fg_film_actor_1 = build :film_actor
		fg_film_actor_2 = build :film_actor
		film_actors = FilmActor.llduang_save [fg_film_actor_1.actor, fg_film_actor_2.actor]
		expect([film_actors[0].actor, film_actors[1].actor]).to eq([fg_film_actor_1.actor, fg_film_actor_2.actor])
	end
end