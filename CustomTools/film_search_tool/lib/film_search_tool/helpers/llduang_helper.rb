# encoding: utf-8

module LlduangHelper


	#获取影片中文名称和影片明细url
	def get_chinese_name_and_detail_url(sigle_film)
		#<h2><a href="http://www.llduang.com/11385.html" rel="bookmark" target="_blank" title="爱与慈悲 Love &amp; Mercy (2014)" _hover-ignore="1">爱与慈悲 Love &amp; Mercy (2014)</a></h2>
		film_name_href_regex = %r(<h2><a[\s\S]*?</a></h2>)
		film_name_href = film_name_href_regex.match sigle_film
		#获取引号中的内容，第一个为影片详细内容的url，第四个为影片名称
		film_name_result_regex = /"[\s\S]*?"/
		film_name_result = film_name_href.to_s.scan(film_name_result_regex)
		#影片详情页
		detail_url = film_name_result[0].to_s.gsub('"','')
		#影片中文名称
		film_chinese_name = film_name_result[3].to_s.gsub('"','').strip

		[film_chinese_name, detail_url]
	end
	#获取影片英文名称
	def get_english_name(sub_sigle_film)
		# str_regex = %q(<span class="pl">又名<\/span>[\s\S]*?[>|<])
		# p str_regex
		get_content_by_regex_type_one(sub_sigle_film, /<span class="pl">又名:<\/span>[\s\S]*?[>|<]/u, '</span>', '<br />', '<')
	end
	#获取导演
	def get_directors(sub_sigle_film)
		get_content_by_regex_type_five(sub_sigle_film, %r(<h3><span class="pl">导演</span>: <span class="attrs">[\s\S]*?</span>), %r(<span class="attrs">[\s\S]*?</span>), '">', '</span>', '/')
	end
	#获取演员
	def get_actors(sub_sigle_film)
		get_content_by_regex_type_three(sub_sigle_film, %r(<span class="actor"><span class="pl">主演</span>: <span class="attrs">[\s\S]*?</span></span>), %r(<span class="attrs">[\s\S]*?</span>), '</span>', '">', '/')
	end
	#获取类别
	def get_categories(sub_sigle_film)
		get_content_by_regex_type_four(sub_sigle_film, %r(<span class="pl">类型[:|：]</span>[\s\S]*?<br />), 'span>', '<br />', '/')
	end
	#获取区域
	def get_area(sub_sigle_film)
		get_content_by_regex_type_one(sub_sigle_film, %r(<span class="pl">制片国家/地区[:|：]</span>[\s\S]*?<br />), 'span>', '<br />')
	end
	#获取logo
	def get_logo(sub_sigle_film)
		get_content_by_regex_type_two(sub_sigle_film, %r(<p><img class="aligncenter"[\s\S]*?</p>), %r(src="[\s\S]*?"), '=', '"')
	end
	#获取直接下载地址
	def get_download_url(sub_sigle_film)
		get_content_by_regex_type_two(sub_sigle_film, %r(<p><span style="color: #ff6600;">磁力下载链接[:|：][\s\S]*?target="_blank">), %r(href="[\s\S]*?"), '="', '"')
	end
	#获取百度云盘地址
	def get_download_baidu_url(sub_sigle_film)
		get_content_by_regex_type_two(sub_sigle_film, %r(<p><span style="color: #ff6600;">百度下载链接[:|：][\s\S]*?target="_blank">), %r(href="[\s\S]*?"), '="', '"')
	end
	#获取百度云盘密码
	def get_download_baidu_password(sub_sigle_film)
		get_content_by_regex_type_two(sub_sigle_film, %r(<p><span style="color: #ff6600;"> 密码[:|：][\s\S]*?</span>), %r(style="color: #0000ff;">[\s\S]*?</span>), '">', '</span>')
	end
	#获取简介
	def get_introduction(sub_sigle_film)
		result = get_content_by_regex_type_two(sub_sigle_film, %r(<h2>[\s\S]*?简介[\s\S]*?<h2>), %r(</h2>[\s\S]*?<h2>), 'h2>', '')
		result.chop.strip
	end
	#获取语言
	def get_language(sub_sigle_film)
		get_content_by_regex_type_one(sub_sigle_film, %r(<span class="pl">语言[:|：][\s\S]*?<br />), 'span>', '<br />')
	end
	#获取公映日期
	def get_make_date(sub_sigle_film)
		get_content_by_regex_type_one(sub_sigle_film, %r(<span class="pl">首播[:|：][\s\S]*?<br />), 'span>', '<br />')
	end
	#获取评分
	def get_grade
		#llduang下没有评分...随机给分
		random = Random.new
		random.rand(5.0...9.0).round
	end
	#获取片长
	def get_duration(sub_sigle_film)
		result = get_content_by_regex_type_one(sub_sigle_film, %r(<span class="pl">片长[:|：][\s\S]*?<br />), 'span>', '<br />')
		0 if result.blank?
	end


	private
	#第一种形式,3步获取结果,返回一个字符串
	def get_content_by_regex_type_one(sub_sigle_film, first_regex, split_regex, first_gsub_regex, second_gsub_regex='')
		regex_result = first_regex.match sub_sigle_film
		split_result = regex_result.to_s.split(split_regex)
		result = ''
		if split_result.count > 1
			result = split_result[1].to_s.gsub(first_gsub_regex, '').strip.gsub(second_gsub_regex, '')
		end
		result
	end
	#第二种形式,4步获取结果,返回一个字符串
	def get_content_by_regex_type_two(sub_sigle_film, first_regex, second_regex, split_regex, gusb_regex)
		first_regex_result = first_regex.match sub_sigle_film
		second_regex_result = second_regex.match first_regex_result.to_s
		split_result = second_regex_result.to_s.split(split_regex)
		result = ''
		if split_result.count > 1
			result = split_result[1].gsub(gusb_regex, '').strip
		end
		result
	end
	#第三种新型,5步获取结果,返回一个数组
	def get_content_by_regex_type_three(sub_sigle_film, first_regex, second_regex, gsub_regex, first_split_regex, second_split_regex)
		first_regex_result = first_regex.match sub_sigle_film
		second_regex_result = second_regex.match first_regex_result.to_s
		gsub_split_result = second_regex_result.to_s.gsub(gsub_regex, '').split(first_split_regex)
		result = []
		if gsub_split_result.count > 1
			split_result = gsub_split_result[1].split(second_split_regex)
			split_result.each do |item|
				result.push item.strip
			end
		end
		result
	end
	#第四种新型,4步获取结果,返回一个数组
	def get_content_by_regex_type_four(sub_sigle_film, first_regex, first_split_regex, gsub_regex, second_split_regex)
		first_regex_result = first_regex.match sub_sigle_film
		# first_result = first_regex_result.match first_regex_result.to_s
		split_result = first_regex_result.to_s.split(first_split_regex)
		result = []
		if split_result.count > 1
			gsub_split_result = split_result[1].gsub(gsub_regex, '').split(second_split_regex)
			gsub_split_result.each do |item|
				result.push item.strip
			end
		end
		result
	end
	#第五种新型,5步获取结果,返回一个数组,和get_content_by_regex_type_three有细微区别
	def get_content_by_regex_type_five(sub_sigle_film, first_regex, second_regex, first_split_regex, gsub_regex, second_split_regex)
		first_regex_result = first_regex.match sub_sigle_film
		second_regex_result = second_regex.match first_regex_result.to_s
		gsub_split_result = second_regex_result.to_s.split(first_split_regex)
		result = []
		if gsub_split_result.count > 1
			split_result = gsub_split_result[1].gsub(gsub_regex, '').split(second_split_regex)
			split_result.each do |item|
				result.push item.strip
			end
		end
		result
	end


end