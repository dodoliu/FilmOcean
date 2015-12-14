

module LlduangHelper


	#获取影片中文名称和影片明细url
	def get_chinese_name_and_detail_url(sigle_film)
		#<h2><a href="http://www.llduang.com/11385.html" rel="bookmark" target="_blank" title="爱与慈悲 Love &amp; Mercy (2014)" _hover-ignore="1">爱与慈悲 Love &amp; Mercy (2014)</a></h2>
		film_name_href_regex = /<h2><a[\s\S]*?<\/a><\/h2>/
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
		# other_title_regex = %r(<span class="pl">又名:</span>[\s\S]*?<br />)
		# other_title = other_title_regex.match sub_sigle_film
		# other_titles = other_title.to_s.split('</span>')
		# e_name = other_titles[1].to_s.gsub('<br />', '').strip
		get_content_by_regex_type_one(sub_sigle_film, %r(<span class="pl">又名:</span>[\s\S]*?<br />), '</span>', '<br />')
	end
	#获取导演
	def get_directors(sub_sigle_film)
		# director_regex = %r(<h3><span class="pl">导演</span>: <span class="attrs">[\s\S]*?</span>)
		# directors_regex = %r(<span class="attrs">[\s\S]*?</span>)
		# director_result = director_regex.match sub_sigle_film
		# directors_result = directors_regex.match director_result.to_s
		# directors_split = directors_result.to_s.split('">')
		# directors_split_result = directors_split[1].gsub('</span>', '').split('/')
		# directors = []
		# directors_split_result.each do |director|
		# 	directors.push director.strip
		# end
		# directors
		get_content_by_regex_type_five(sub_sigle_film, %r(<h3><span class="pl">导演</span>: <span class="attrs">[\s\S]*?</span>), %r(<span class="attrs">[\s\S]*?</span>), '">', '</span>', '/')
	end
	#获取演员
	def get_actors(sub_sigle_film)
		# actor_regex = %r(<span class="actor"><span class="pl">主演</span>: <span class="attrs">[\s\S]*?</span></span>)
		# actors_regex = %r(<span class="attrs">[\s\S]*?</span>)
		# actor_result = actor_regex.match sub_sigle_film
		# actors_result = actors_regex.match actor_result.to_s
		# actors_split = actors_result.to_s.gsub('</span>', '').split('">')
		# actors_split_result = actors_split[1].split('/')
		# actors = []
		# actors_split_result.each do |actor|
		# 	actors.push actor.strip
		# end
		# actors
		get_content_by_regex_type_three(sub_sigle_film, %r(<span class="actor"><span class="pl">主演</span>: <span class="attrs">[\s\S]*?</span></span>), %r(<span class="attrs">[\s\S]*?</span>), '</span>', '">', '/')
	end
	#获取类别
	def get_categories(sub_sigle_film)
		# category_regex = %r(<span class="pl">类型:</span>[\s\S]*?<br />)
		# category_result = category_regex.match sub_sigle_film
		# categories_split = category_result.to_s.split('span>')
		# categories_split_result = categories_split[1].gsub('<br />', '').split('/')
		# categories = []
		# categories_split_result.each do |category|
		# 	categories.push category.strip
		# end
		# categories
		get_content_by_regex_type_four(sub_sigle_film, %r(<span class="pl">类型:</span>[\s\S]*?<br />), 'span>', '<br />', '/')
	end
	#获取区域
	def get_area(sub_sigle_film)
		# area_regex = %r(<span class="pl">制片国家/地区:</span>[\s\S]*?<br />)
		# area_result = area_regex.match sub_sigle_film
		# area_result_split = area_result.to_s.split('span>')
		# result = area_result_split[1].gsub('<br />', '').strip
		get_content_by_regex_type_one(sub_sigle_film, %r(<span class="pl">制片国家/地区:</span>[\s\S]*?<br />), 'span>', '<br />')

	end
	#获取logo
	def get_logo(sub_sigle_film)
		# logo_regex = %r(<p><img class="aligncenter"[\s\S]*?</p>)
		# logo_img_src_regex = %r(src="[\s\S]*?")
		# logo_result = logo_regex.match sub_sigle_film
		# logo_img_src_result = logo_img_src_regex.match logo_result.to_s
		# logo_img_src_split = logo_img_src_result.to_s.split('=')
		# logo = logo_img_src_split[1].gsub('"','').strip
		get_content_by_regex_type_two(sub_sigle_film, %r(<p><img class="aligncenter"[\s\S]*?</p>), %r(src="[\s\S]*?"), '=', '"')
	end
	#获取直接下载地址
	def get_download_url(sub_sigle_film)
		# url_regex = %r(<p><span style="color: #ff6600;">磁力下载链接[\s\S]*?target="_blank">)
		# url_href_regex = %r(href="[\s\S]*?")
		# url_result = url_regex.match sub_sigle_film
		# url_href_result = url_href_regex.match url_result.to_s
		# url_href_result_split = url_href_result.to_s.split('="')
		# url = url_href_result_split[1].gsub('"', '').strip
		get_content_by_regex_type_two(sub_sigle_film, %r(<p><span style="color: #ff6600;">磁力下载链接[\s\S]*?target="_blank">), %r(href="[\s\S]*?"), '="', '"')
	end
	#获取百度云盘地址
	def get_download_baidu_url(sub_sigle_film)
		url_regex = %r(<p><span style="color: #ff6600;">百度下载链接[\s\S]*?target="_blank">)
		url_href_result



	end

	#获取百度云盘密码
	def get_download_baidu_password_url(sub_sigle_film)
		
	end


	private
	#第一种形式,3步获取结果,返回一个字符串
	def get_content_by_regex_type_one(sub_sigle_film, first_regex, split_regex, gsub_regex)
		regex_result = first_regex.match sub_sigle_film
		split_result = regex_result.to_s.split(split_regex)
		result = split_result[1].to_s.gsub(gsub_regex, '').strip
	end
	#第二种形式,4步获取结果,返回一个字符串
	def get_content_by_regex_type_two(sub_sigle_film, first_regex, second_regex, split_regex, gusb_regex)
		first_regex_result = first_regex.match sub_sigle_film
		second_regex_result = second_regex.match first_regex_result.to_s
		split_result = second_regex_result.to_s.split(split_regex)
		result = split_result[1].gsub(gusb_regex, '').strip
	end
	#第三种新型,5步获取结果,返回一个数组
	def get_content_by_regex_type_three(sub_sigle_film, first_regex, second_regex, gsub_regex, first_split_regex, second_split_regex)
		first_regex_result = first_regex.match sub_sigle_film
		second_regex_result = second_regex.match first_regex_result.to_s
		gsub_split_result = second_regex_result.to_s.gsub(gsub_regex, '').split(first_split_regex)
		split_result = gsub_split_result[1].split(second_split_regex)
		result = []
		split_result.each do |item|
			result.push item.strip
		end
		result
	end
	#第四种新型,4步获取结果,返回一个数组
	def get_content_by_regex_type_four(sub_sigle_film, first_regex, first_split_regex, gsub_regex, second_split_regex)
		first_regex_result = first_regex.match sub_sigle_film
		# first_result = first_regex_result.match first_regex_result.to_s
		split_result = first_regex_result.to_s.split(first_split_regex)
		gsub_split_result = split_result[1].gsub(gsub_regex, '').split(second_split_regex)
		result = []
		gsub_split_result.each do |item|
			result.push item.strip
		end
		result
	end
	#第五种新型,5步获取结果,返回一个数组,和get_content_by_regex_type_three有细微区别
	def get_content_by_regex_type_five(sub_sigle_film, first_regex, second_regex, first_split_regex, gsub_regex, second_split_regex)
		first_regex_result = first_regex.match sub_sigle_film
		second_regex_result = second_regex.match first_regex_result.to_s
		gsub_split_result = second_regex_result.to_s.split(first_split_regex)
		split_result = gsub_split_result[1].gsub(gsub_regex, '').split(second_split_regex)
		result = []
		split_result.each do |item|
			result.push item.strip
		end
		result
	end


end