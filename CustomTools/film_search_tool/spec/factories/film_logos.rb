FactoryGirl.define do
	factory :film_logo do
		sequence(:logo_url) { |n| "http://logo_url.com#{n}" }
	end
end