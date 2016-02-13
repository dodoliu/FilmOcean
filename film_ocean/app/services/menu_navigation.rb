class MenuNavigation
	#key: controller
	#name: 中文名称
	#name_value: url
	#sub_navigations: 编辑/删除
	attr_accessor :key, :name, :name_value, :sub_navigations

	def initialize
		sub_menu = Hash.new
		sub_menu['new'] = '新增'
		sub_menu['edit'] = '编辑'
		@sub_navigations = sub_menu
	end
end