#encoding=utf-8

=begin
Author: LDY
Date: 2015-10-13
Desc: 针对http://www.llduang.com/，获取该站点上的影片内容
=end

require 'net/http'
require 'cgi'

CurrFilePath = File.dirname(__FILE__)
require CurrFilePath + '/application'
require CurrFilePath + '/helpers/common_helper'
require CurrFilePath + '/helpers/require_models_helper'

#定向抓lldunag内容
module Llduang
	class Website < Application
		include Helper

		# attr_accessor :chiness_name, :enginsh_name, :source = 'llduang', :source_url

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
max_page_number
				#分析出第一页的内容，
				# analyse_content response

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
			FilmTitle.create(:chinese_name=>"中文名A")
		end

		# private

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

			#匹配单个影片信息区块
			sigle_film_info_regex = /<li class="post box row fixed-hight">[\s\S]*?<\/li>/
			sigle_film_infos = sigle_film_info_regex.match response


			# sigle_film_infos.each do |sigle_film|


				#影片名称
				#<h2><a href="http://www.llduang.com/11385.html" rel="bookmark" target="_blank" title="爱与慈悲 Love &amp; Mercy (2014)" _hover-ignore="1">爱与慈悲 Love &amp; Mercy (2014)</a></h2>
				film_name_href_regex = /<h2><a[\s\S]*?<\/a><\/h2>/
				film_name_href = film_name_href_regex.match sigle_film_infos[0]
				#获取引号中的内容，第一个为影片详细内容的url，第四个位影片名称
				film_name_result_regex = /"[\s\S]*?"/
				film_name_result = film_name_result_regex.match film_name_href.to_s

				film_name_result[0].to_s.gsub('"','')

				# set_film_source @film_name_result[0].to_s.gsub('\"','')



			# end

		end

		#来源信息
		def set_film_source(source_url)
			source_info = new Model::FilmSource
			source_info.set source_url

			p source_info
		end
		#影片名信息
		def set_file_title(c_name,e_name)
			title_info = new Model::FilmTitle
			title_info.set c_name, e_name
			title_info.save
		end

	end
end

aaa = Llduang::Website.new
aaa.save_content


