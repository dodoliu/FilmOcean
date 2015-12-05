#encoding=utf-8

=begin
Author: LDY
Date: 2015-11-29
Desc: 影片名称
=end

# require File.dirname(__FILE__) + '/base_model'

# module Model
# 	class FilmTitle < BaseModel
# 		attr_accessor :chinese_name, :english_name

# 		def set(c_name,e_name)
# 			@chinese_name = c_name
# 			@english_name = e_name
# 		end

# 		def save
# 			sql = "insert into film_titles(id,chinese_name,english_name,created_at,updated_at) values(3,'你好','nihao','2015-12-03','2015-12-03')"

# 			@client.query(sql)
# 		end
# 	end
# end


# aaaa = Model::FilmTitle.new
# aaaa.save


class FilmTitle < ActiveRecord::Base
end
