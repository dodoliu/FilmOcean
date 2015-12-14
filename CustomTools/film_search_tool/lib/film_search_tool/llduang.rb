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
require CurrFilePath + '/helpers/llduang_helper'
require CurrFilePath + '/helpers/require_models_helper'

#定向抓lldunag内容
module Llduang
	class Website < Application
		include Helper
		include LlduangHelper

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
				# response = (url_get url).force_encoding('utf-8')

				#为了不影响网站的正常访问，每次请求之后，主线程sleep 5分钟
				sleep 60 * 5

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
# max_page_number
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
		#获取明细内容
		def get_sub_content(sub_url, film_chinese_name)
			response = (url_get sub_url).force_encoding('utf-8')

			context_regex = /<div class="context">[\s\S]*?<\/div>/

			#导演
			director_regex = /<h3><span class="pl">导演<\/span>: <span class="attrs">[\s\S]*?<\/span>/

			#主演
			actor_regex = /<span class="actor"><span class="pl">主演<\/span>: <span class="attrs">[\s\S]*?<\/span><\/span>/

			#类别
			category_regex = /<span class="pl">类型:<\/span>[\s\S]*?<br \/>/

			#区域
			area_regex = /<span class="pl">制片国家\/地区:<\/span>[\s\S]*?<br \/>/

			#英文名、别名
			other_title_regex = /<span class="pl">又名:<\/span>[\s\S]*?<br \/>/


			#logo
			logo_regex = /<p><img class="aligncenter"[\s\S]*?<\/p>/

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
			max_page_number_url = max_page_number_regex.match response
			#该分类具有的最大分页
			max_page_number = (/\d{1,5}/.match max_page_number_url.to_s).to_s.to_i
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

			sigle_film_infos.each do |sigle_film|
				#获取影片名称和影片详情页
				film_chinese_name, detail_url = get_chinese_name_detail_url sigle_film
				#获取明细内容
				get_sub_content detail_url, film_chinese_name
			end
		end
	end
end