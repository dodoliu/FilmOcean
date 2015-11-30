#encoding=utf8

=begin
Author: LDY
Date: 2015-10-13
Desc: 针对http://www.llduang.com/，获取该站点上的影片内容
=end

require 'net/http'
require 'cgi'
require File.dirname(__FILE__) + '/helpers/common_helper.rb'
require File.dirname(__FILE__) + '/helpers/require_models_helper.rb'

#定向抓lldunag内容
module Llduang
	class Website
		include Helper
		# 获取内容
		def get_content
			all_film_classes = film_classes
			all_film_classes.each do |film_class|
				url = 'http://www.llduang.com/tag/' + film_class

				#需要将获取的内容强制转换为utf-8编码，才能用正则匹配
				#写法1
				# uri = URI::escape url
				# response = Net::HTTP.get URI(uri)

				#写法2
				# response = (get url).force_encoding('utf-8')

				response = %q(<div class="clear"></div>
			<div class="navigation container">
			<div class='pagination'>
			<a href='http://www.llduang.com/tag/%E4%BC%A0%E8%AE%B0' class='current'>1</a>
			<a href='http://www.llduang.com/tag/%E4%BC%A0%E8%AE%B0/page/2'>2</a>
			<a href='http://www.llduang.com/tag/%E4%BC%A0%E8%AE%B0/page/3'>3</a>
			<a href="http://www.llduang.com/tag/%E4%BC%A0%E8%AE%B0/page/2" class="next">下一页</a>
			<a href='http://www.llduang.com/tag/%E4%BC%A0%E8%AE%B0/page/3' class='extend' title='跳转到最后一页'>尾页</a>
			</div></div>)
				# p response

				#需要翻页的数量
				max_page_number = get_max_page_number response, film_class

				#分析出第一页的内容，


				#遍历剩下的内容
				# (2..max_page_number).each do |index|
				# 	new_url = url + "\/page\/#{index}"
				# 	# new_response = Net::HTTP.get URI(new_url)
				# 	# analyse_content new_response
				# 	new_response = get new_url

				# end
			end
		end



		#保存内容
		def save_content

		end

		private

		#所有影片分类
		def film_classes
			#%w(传记 伦理 儿童 冒险 剧情 动作 动画 历史 古装 同性 喜剧 奇幻 家庭 恐怖 悬疑 情色 惊悚 戏曲 战争 歌舞 武侠 灾难 爱情 犯罪 玄幻 短片 科幻 纪录 舞蹈 英语 西部 言情 运动 都市 韩剧 音乐 魔幻)
			%w(传记)
		end

		#获取分类对应的最大页码
		def get_max_page_number(response,film_class)
			#<a href="http://www.llduang.com/tag/%e5%8a%a8%e4%bd%9c/page/16" class="extend" title="跳转到最后一页">尾页</a>
			max_page_number_regex = /<a href='http:\/\/www.llduang.com\/tag\/#{CGI::escape(film_class)}\/page\/\d{1,5}' class='extend' title='跳转到最后一页'>尾页<\/a>/
			# p max_page_number_regex
			max_page_number_url = max_page_number_regex.match response
			# p max_page_number_url
			#该分类具有的最大分页
			max_page_number = (/\d{1,5}/.match max_page_number_url.to_s).to_s.to_i
			# p max_page_number
		end

		#分析内容
		def analyse_content(response)
			# resource_ul = /<ul id=\"post_container\" class=\"masonry clearfix\">.*<\/ul>/.match response
			# p '--analyse_content--'
			# p resource_ul

			# resource_li = resource_ul.to_s.scan




		end

	end
end

aaa = Llduang::Website.new
aaa.get_content


