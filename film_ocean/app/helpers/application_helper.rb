module ApplicationHelper

	#
	# 后端的导航
	#
	def backend_nvigation
		controller_name = params[:controller].to_s.gsub 'backend/',''
		action_name = params[:action]

		navigation_index = backend_navigations.index{ |item| item.key == controller_name }
		navigation_index = 0 if navigation_index.blank?
		navigation = backend_navigations[navigation_index]

		result = <<-EOF
        <div class="header">
            <h1 class="page-title">#{navigation.name}</h1>
			<ul class="breadcrumb">
		EOF

		if navigation_index != 0
			result << "<li><a href='#{backend_root_path}'>首页</a></li>"
			if action_name == 'index'
				result << "<li class='active'>#{navigation.name}</li>"
			else
				result << "<li><a href='../../../#{navigation.name_value}'>#{navigation.name}</a></li>"
				result << "<li class='active'>#{navigation.sub_navigations[action_name]}</li>"
			end
		else
			result << "<li class='active'>首页</li>"
		end

		result << '</ul>'
        result << '</div>'

		raw result
	end

	private
	def backend_navigations
		navigations = []
		conrollers = %w(admins film_titles film_logos films film_actors film_areas film_categories film_directors film_downloads film_introductions)
		names = %w(首页 名称管理 Logo管理 影片管理 演员管理 区域管理 分类管理 导演管理 下载地址管理 简介管理)

		conrollers.each_with_index do |c,index|
			menu_navigation = MenuNavigation.new
			menu_navigation.key = c
			menu_navigation.name = names[index]
			menu_navigation.name_value = 'backend/' + c
			navigations.push menu_navigation
		end
		return navigations
	end
end