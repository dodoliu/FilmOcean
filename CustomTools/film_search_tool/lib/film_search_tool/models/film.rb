#encoding=utf-8

class Film < ActiveRecord::Base
	has_and_belongs_to_many :film_categories
	has_and_belongs_to_many :film_directors
	has_and_belongs_to_many :film_actors
	has_many :film_downloads
	has_one :film_title
	has_one :film_logo
	has_one :film_area
	has_one :film_introduction

	protected

	#参数0: 中文名
	#参数1: 英文名称
	#参数2: title_id
	#参数3: logo_id
	#参数4: area_id
	#参数5: introduction_id
	#参数6: 语言
	#参数7: 公映日期
	#参数8: 展示下载地址类型, 默认为3
	#参数9: 点击量
	#参数10: 评分
	#参数11: 片长
	def self.save(*args)
        film = Film.find_by chinese_name: args[0], english_name: args[1]
        if film.blank?
                film = Film.create(chinese_name: args[0],
                        english_name: args[1], film_title_id: args[2],
                        film_logo_id: args[3], film_area_id: args[4],
                        film_introduction_id: args[5], film_language: args[6],
                        make_date: args[7], show_type: args[8],
                        click_rate: args[9], grade: args[10],
                        duration: args[11])
        end
        return film
	end

end
