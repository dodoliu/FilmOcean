# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#初始化分类
categories = %w(传记 伦理 儿童 冒险 剧情 动作 动画 历史 古装 同性 喜剧 奇幻 家庭 恐怖 悬疑 情色 惊悚 戏曲 战争 歌舞 武侠 灾难 爱情 犯罪 玄幻 短片 科幻 纪录 舞蹈 英语 西部 言情 运动 都市 韩剧 音乐 魔幻)
FilmCategory.transaction do
	categories.each do |item|
		FilmCategory.create(category: item)
	end
end
