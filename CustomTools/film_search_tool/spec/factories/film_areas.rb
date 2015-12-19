FactoryGirl.define do
	factory :film_area do
		sequence(:area) { |n| "区域#{n}" }
	end
end