FactoryGirl.define do
	factory :film_actor do
		sequence(:actor) { |n| "演员#{n}" }
	end
end