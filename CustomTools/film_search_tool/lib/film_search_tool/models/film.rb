#encoding=utf-8

class Film < ActiveRecord::Base
	has_and_belongs_to_many :film_categories
	has_and_belongs_to_many :film_directors
	has_and_belongs_to_many :film_actors
	has_many :film_downloads
	has_one :film_title
	has_one :film_logo
	has_one :film_area
	has_one :film_introduction
end
