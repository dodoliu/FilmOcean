#encoding=utf-8

module Helper
	#传入url,返回get到response
	def url_get(url)
		uri = URI::escape url
		response = Net::HTTP.get URI(uri)
	end
end