FactoryGirl.define do
	factory :film_title do
		sequence(:chinese_name) { |n| "中文名称#{n}" }
		sequence(:english_name) { |n| "英文名称#{n}" }
	end
end