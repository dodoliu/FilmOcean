module WebSite
	class ApplicationController < ApplicationController::Base
		protect_from_forgery with: :exception
		layout 'website'
	end
end