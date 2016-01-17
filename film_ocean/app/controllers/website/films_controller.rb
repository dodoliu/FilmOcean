
module Website
	class FilmsController < Website::ApplicationController
		def index
			@films = Film.all
		end
	end
end