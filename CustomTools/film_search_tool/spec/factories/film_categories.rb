FactoryGirl.define do
	factory :film_category do
		sequence(:category) { |n| "传记#{n}"}
	end
end