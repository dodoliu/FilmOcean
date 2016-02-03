module Website
	class FilmsController < Website::ApplicationController
		def index
			@films = Film.all
		end

		def film_detail
		end
	end
end