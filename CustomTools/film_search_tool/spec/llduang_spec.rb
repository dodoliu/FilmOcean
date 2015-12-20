# encoding: utf-8
require 'spec_helper'
require 'film_search_tool/llduang'

RSpec.describe Llduang do

	let(:response) { '<div class="context">
				<div id="post_content"><h3> <img class="aligncenter" src="http://i12.tietuku.com/c3f9227e958e25f6s.jpg" alt="鬼吹灯之寻龙诀.2015.TS" alt="" /></h3>
<p>&nbsp;</p>
<h3><span class="pl">导演</span>: <span class="attrs">乌尔善</span><br />
<span class="pl">编剧</span>: <span class="attrs">张家鲁</span><br />
<span class="actor"><span class="pl">主演</span>: <span class="attrs">陈坤 / 黄渤 / 舒淇 / 杨颖 / 夏雨 / 刘晓庆 /颜卓灵</span></span><br />
<span class="pl">类型:</span> 剧情 / 动作 / 奇幻 / 冒险<br />
<span class="pl">制片国家/地区:</span> 中国大陆<br />
<span class="pl">语言:</span> 汉语普通话<br />
<span class="pl">上映日期:</span> 2015-12-18(中国大陆)<br />
<span class="pl">片长:</span> 125分钟(中国大陆)<br />
<span class="pl">又名:</span> 乌尔善版鬼吹灯 / 鬼吹灯之寻龙诀 / 鬼吹灯 / The Ghouls / Mojin - The Lost Legend</h3>
<h2>寻龙诀的剧情简介  ·  ·  ·  ·  ·  ·</h2>
<div id="link-report" class="indent"><span class="">　　上世纪80年代末，胡八一（陈坤 饰）、王凯旋（黄渤 饰）与Shirley杨（舒淇 饰）在美国打算金盆洗手，本来叱咤风云的摸金校尉沦为街头小贩被移民局追得满街跑。就在此时，意外发现20年前死在草原上的初恋对象丁思甜（Angelababy 饰）可能还活着，胡八一、王凯旋、Shirley杨决定再入草原千年古墓……</span></div>
<h2>寻龙诀的下载地址</h2>
<p><span style="color: #ff6600;">磁力下链接：</span></p>
<p><span style="color: #ff6600;">百度下载链接：<span style="color: #0000ff;"><a style="color: #0000ff;" href="http://pan.baidu.com/s/1jHutM4I" target="_blank">http://pan.baidu.com/s/1jHutM4I</a> </span></span></p>
<p><span style="color: #ff6600;">密码：7ue5</span></p>
<p><span style="color: #0000ff;"><a style="color: #0000ff;" href="http://www.llduang.com/21028.html" target="_blank">在线播放戳这里》》》</a></span></p>
<div class="indent">' }

	it "llduang保存抓取到的数据" do
		website = Llduang::Website.new
		website.save_content "http://www.llduang.com/23442.html", "鬼吹灯之寻龙诀.2015.TS", response
	end
end