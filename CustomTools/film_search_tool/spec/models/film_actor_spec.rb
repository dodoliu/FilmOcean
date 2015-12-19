require 'spec_helper'

RSpec.describe FilmActor do
	let(:film_actor) { build :film_actor }

	it "保存演员" do
		tmp_film_actor = FilmActor.create actor: film_actor.actor
		expect(tmp_film_actor.actor).to eq(film_actor.actor)
	end
end