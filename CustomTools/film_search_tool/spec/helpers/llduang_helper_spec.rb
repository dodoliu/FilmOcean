require 'spec_helper'
require 'film_search_tool/helpers/llduang_helper'

RSpec.describe LlduangHelper do

	include LlduangHelper

	sigle_film = '<li class="post box row fixed-hight">
                	                    <div class="thumbnail">
                        <a href="http://www.llduang.com/21837.html" class="zoom" rel="bookmark" target="_blank" title="杜拉拉追婚记-枪版">
                                                      	                                <img src="http://i12.tietuku.com/3615b1a89d4c8902s.jpg" width="300" height="400" alt="杜拉拉追婚记-枪版"/>                                                  <div class="zoomOverlay"></div>
                        </a>
                    </div>
                    <div class="article">
                        <h2><a href="http://www.llduang.com/21837.html" rel="bookmark" target="_blank" title="杜拉拉追婚记-枪版">杜拉拉追婚记-枪版</a></h2>
                                                     <div class="entry_post">
                                <p>
导演: 安竹间
编剧: 苟兴妍 / 安竹间
主演: 周渝民 / 林依晨 / 陈柏霖 / 林珍娜 / 李佳航/ 更多...
类型: 喜剧 / 爱情
制片国家/地区: 中国大陆
语言: 汉语...                                </p>
                            </div>
                                            </div>
    				<div class="info">
                        <span class="info_date info_ico">12-08</span>
                    	<span class="info_views info_ico">4589</span>
                        <span class="info_comment info_ico"><a href="http://www.llduang.com/21837.html#comments">3</a></span>
                        <span class="info_category info_ico"><a href="http://www.llduang.com/category/%e6%9c%80%e6%96%b0%e7%94%b5%e5%bd%b1/%e5%9b%bd%e4%ba%a7%e7%94%b5%e5%bd%b1" rel="category tag">国产电影</a></span> 
    				</div>
    		</li>'

   sub_sigle_film = '<div class="context">
				<div id="post_content"><p><img class="aligncenter" src="http://i13.tietuku.com/6b5886c67cc4d60ds.jpg" alt="夏洛特烦恼-HD720P-高清中字" alt="" /></p>
<h3><span class="pl">导演</span>: <span class="attrs">闫非 / 彭大魔</span><br />
<span class="pl">编剧</span>: <span class="attrs">闫非 / 彭大魔</span><br />
<span class="actor"><span class="pl">主演</span>: <span class="attrs">沈腾 / 马丽 / 尹正 / 艾伦 / 王智 / 更多...</span></span><br />
<span class="pl">类型:</span> 喜剧 / 爱情<br />
<span class="pl">制片国家/地区:</span> 中国大陆<br />
<span class="pl">语言:</span> 汉语普通话<br />
<span class="pl">上映日期:</span> 2015-09-30(中国大陆)<br />
<span class="pl">片长:</span> 104分钟<br />
<span class="pl">又名:</span> Goodbye Mr. Loser<br />
<span class="pl">IMDb链接:</span> tt5061814</h3>
<p><strong><span style="color: #0000ff;">PS:下载到本地观看会更清晰，因为百度在线播放会转码，清晰度自然就降低了！</span></strong></p>
<h2>夏洛特烦恼的剧情简介  ·  ·  ·  ·  ·  ·</h2>
<h3>昔日校花秋雅（王智 饰）的婚礼正在隆重举行，学生时代暗恋秋雅的夏洛（沈腾 饰）看着周围事业成功的老同学，心中泛起酸味，借着七分醉意大闹婚礼现场，甚至惹得妻子马冬梅（马丽 饰）现场发飙，而他发泄过后却在马桶上睡着了。梦里他重回校园，追求到他心爱的女孩、让失望的母亲重展笑颜、甚至成为无所不能的流行乐坛巨星……<br />
醉生梦死中，他发现身边人都在利用自己，只有马冬梅是最值得珍惜的……</h3>
<h2> 夏洛特烦恼-HD720P下载链接：</h2>
<p><span style="color: #ff6600;">磁力下载链接：<span style="color: #0000ff;"><a style="color: #0000ff;" href="magnet:?xt=urn:btih:d824c26dcb1f9f650ae70f15e18be1f185bc6323&amp;tr=http://bt.mp4ba.com:2710/announce" target="_blank"> 夏洛特烦恼.Goodbye.Mr.Loser.2015.HD720P</a>            <span style="color: #ff0000;"><a style="color: #ff0000;" href="http://www.llduang.com/17051.html" target="_blank">戳这里查看磁力使用方法》》》</a></span></span></span></p>
<p><span style="color: #ff6600;">百度下载链接:<span style="color: #0000ff;"><a style="color: #0000ff;" href="http://pan.baidu.com/s/1hqTsQIo" target="_blank">http://pan.baidu.com/s/1hqTsQIo</a></span></span></p>
<p><span style="color: #ff6600;"> 密码:<span style="color: #000000;"> <span style="color: #0000ff;"> mdb2 </span></span></span></p>
<h2><span style="color: #0000ff;"><a style="color: #0000ff;" href="http://www.llduang.com/17051.html" target="_blank">网盘链接失效获取资源方法</a></span></h2>
<h2>一只大榴莲分享官方QQ群：</h2>
<p><span style="color: #0000ff;"><a style="color: #0000ff;" href="http://jq.qq.com/?_wv=1027&amp;k=heaXD5" target="_blank">点击链接加入群【榴莲哥福利6群】</a></span></p>
<p>榴莲哥福利6群 ：491302684</p>
<p><span style="color: #ff0000;">点击链接加入群（1群；2群；3群 ；4群；5群已满员）</span></p>
</div>'

	it "获取影片中文名称和详情页url" do
		c_name, detail_url = get_chinese_name_and_detail_url sigle_film
		expect(c_name).to eq('杜拉拉追婚记-枪版')
		expect(detail_url).to eq('http://www.llduang.com/21837.html')
	end

	it "获取英文名称" do
		expect(get_english_name(sub_sigle_film)).to eq('Goodbye Mr. Loser')
	end

	it "获取导演名称" do
		expect(get_directors(sub_sigle_film)).to eq(['闫非', '彭大魔'])
	end

	it "获取主演" do
		expect(get_actors(sub_sigle_film)).to eq(['沈腾', '马丽', '尹正', '艾伦', '王智', '更多...'])
	end

	it "获取类别" do
		expect(get_categories(sub_sigle_film)).to eq(['喜剧','爱情'])
	end
	it "获取区域" do
		expect(get_area(sub_sigle_film)).to eq('中国大陆')
	end

	it "获取logo" do
		expect(get_logo(sub_sigle_film)).to eq('http://i13.tietuku.com/6b5886c67cc4d60ds.jpg')
	end

	it "获取磁力下载链接" do
		expect(get_download_url(sub_sigle_film)).to eq('magnet:?xt=urn:btih:d824c26dcb1f9f650ae70f15e18be1f185bc6323&amp;tr=http://bt.mp4ba.com:2710/announce')
	end

	it "获取百度云盘下载地址" do
		expect(get_download_baidu_url(sub_sigle_film)).to eq('http://pan.baidu.com/s/1hqTsQIo')
	end

	it "获取百度云盘下载地址密码" do
		expect(get_download_baidu_password_url(sub_sigle_film)).to eq('mdb2')
	end
end