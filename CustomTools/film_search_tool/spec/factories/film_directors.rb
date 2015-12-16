FactoryGirl.define do
	factory :film_director do
		# sequence :director do |n|
		# 	"导演#{n}"
		# end
		sequence(:director) { |n| "导演#{n}" }
	end
end