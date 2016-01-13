# encoding: utf-8

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
				response = (url_get url).force_encoding('utf-8')

				#为了不影响网站的正常访问，每次请求之后，主线程sleep 5分钟
				sleep 5

				# 	response = %q(<div class="clear"></div>
				# <div class="navigation container">
				# <div class='pagination'>
				# <a href='http://www.llduang.com/tag/%E4%BC%A0%E8%AE%B0' class='current'>1</a>
				# <a href='http://www.llduang.com/tag/%E4%BC%A0%E8%AE%B0/page/2'>2</a>
				# <a href='http://www.llduang.com/tag/%E4%BC%A0%E8%AE%B0/page/3'>3</a>
				# <a href="http://www.llduang.com/tag/%E4%BC%A0%E8%AE%B0/page/2" class="next">下一页</a>
				# <a href='http://www.llduang.com/tag/%E4%BC%A0%E8%AE%B0/page/3' class='extend' title='跳转到最后一页'>尾页</a>
				# </div></div>)
				# p response

				#需要翻页的数量
				max_page_number = get_max_page_number response, film_class
# max_page_number
				#分析出第一页的内容，
				analyse_content response

				#遍历剩下的内容
				(2..max_page_number).each do |index|
					new_url = url + "\/page\/#{index}"
					new_response = Net::HTTP.get URI(new_url)
					analyse_content new_response
					# new_response = get new_url
				end
			end
		end

		#获取明细内容
		def get_sub_content(sub_url, film_chinese_name)
			response = (url_get sub_url).force_encoding('utf-8')
			save_content sub_url, film_chinese_name, response
		end

		def save_content(sub_url, film_chinese_name, response)
			context_regex = %r(<div class="context">[\s\S]*?</div>[\s\S]*?<div class="indent">)
			context_result = context_regex.match(response).to_s

			# p context_result
			#中文名称, 间接下载地址(明细地址)
			detail_url = sub_url

			#英文名称
			film_english_name = get_english_name context_result
			$LOGGER.info("film_english_name:" + film_english_name)
			#导演
			directors = get_directors context_result
			$LOGGER.info("directors:" + directors.to_s)
			#演员
			actors = get_actors context_result
			$LOGGER.info("actors:" + actors.to_s)
			#类别
			categories = get_categories context_result
			$LOGGER.info("categories:" + categories.to_s)
			#区域
			area = get_area context_result
			$LOGGER.info("area:" + area)
			#直接下载地址
			download_url = get_download_url context_result
			$LOGGER.info("download_url:" + download_url)
			#百度云盘地址
			download_baidu_url = get_download_baidu_url context_result
			$LOGGER.info("download_baidu_url:" + download_baidu_url)
			#百度云盘密码
			download_baidu_password = get_download_baidu_password context_result
			$LOGGER.info("download_baidu_password:" + download_baidu_password)
			#logo
			logo_url = get_logo context_result
			$LOGGER.info("logo_url:" + logo_url)
			#简介
			introduction = get_introduction context_result
			$LOGGER.info("introduction:" + introduction)
			#语言
			language = get_language context_result
			$LOGGER.info("language:" + language)
			#公映日期
			make_date = get_make_date context_result
			$LOGGER.info("make_date:" + make_date)
			#评分
			grade = get_grade
			$LOGGER.info("grade:" + grade.to_s)
			#片长
			duration = get_duration context_result
			$LOGGER.info("duration:" + duration.to_s)

			film_title = FilmTitle.save film_chinese_name, film_english_name
			film_logo = FilmLogo.save logo_url
			film_area = FilmArea.save area
			film_introduction = FilmIntroduction.save introduction
			film = Film.save(film_chinese_name, film_english_name, film_title.id,
				film_logo.id, film_area.id, film_introduction.id,
				language, make_date, 3, 0, grade, duration)

			film.film_categories.save(film, categories)

			film.film_actors.save(film, actors)

			film.film_directors.save(film, directors)

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
			(/\d{1,5}/.match max_page_number_url.to_s).to_s.to_i
		end

		#分析内容
		def analyse_content(response)
			# resource_ul = /<ul id=\"post_container\" class=\"masonry clearfix\">.*<\/ul>/.match response
			# p '--analyse_content--'
			# p resource_ul

			# resource_li = resource_ul.to_s.scan

			#匹配单个影片信息区块
			sigle_film_info_regex = /<li class="post box row fixed-hight">[\s\S]*?<\/li>/
			sigle_film_infos = (sigle_film_info_regex.match response).to_a

			sigle_film_infos.each do |sigle_film|
				#获取影片名称和影片详情页
				film_chinese_name, detail_url = get_chinese_name_and_detail_url sigle_film
				#获取明细内容
				get_sub_content detail_url, film_chinese_name
			end
		end
	end
end

aaa = Llduang::Website.new
aaa.get_contentbackend

