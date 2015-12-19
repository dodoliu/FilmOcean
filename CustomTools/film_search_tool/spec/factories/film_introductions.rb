FactoryGirl.define do
	factory :film_introduction do
		sequence(:introduction) { |n| "这是简介#{n}" }
	end
end