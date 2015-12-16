FactoryGirl.define do
	factory :film_download do
		download_url 'http://bing.com'
		download_contact_url 'http://google.com'
		download_other_url 'http://youtube.com'
	    expand 'abcd'
	end
end