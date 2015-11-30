#encoding=utf-8

=begin
Author: LDY
Date: 2015-10-13
Desc: 通用辅助函数
=end

module Helper
	#传入url,返回get到response
	def get(url)
		uri = URI::escape url
		response = Net::HTTP.get URI(uri)
	end
end