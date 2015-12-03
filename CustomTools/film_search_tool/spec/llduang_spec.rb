require 'spec_helper'
require 'film_search_tool/llduang'

RSpec.describe Llduang do
	it "validate max_page_number" do
		llduang = Llduang::Website.new
		# llduang.get_content

		expect(llduang.film_classes).to eq(["传记"])
	end

	it "validate source" do
		llduang = Llduang::Website.new
		expect(llduang.analyse_content('<li class="post box row fixed-hight">                	                    <div class="thumbnail">                        <a href="http://www.llduang.com/18336.html" class="zoom" rel="bookmark" target="_blank" title="成为简·奥斯汀 Becoming Jane (2007)">                                                      	                                <img src="http://i12.tietuku.com/10198cdafef9c7ccs.jpg" width="300" height="400" alt="成为简·奥斯汀 Becoming Jane (2007)"/>                                                  <div class="zoomOverlay"></div>                        </a>                    </div>                    <div class="article">                        <h2><a href="http://www.llduang.com/18336.html" rel="bookmark" target="_blank" title="成为简·奥斯汀 Becoming Jane (2007)">成为简·奥斯汀 Becoming Jane (2007)</a></h2>                                                     <div class="entry_post">                                <p>                                导演: 朱里安·杰拉德 编剧: Sarah Williams / Kevin Hood / 简·奥斯汀 主演: 安妮·海瑟薇 / 詹姆斯·麦卡沃伊 / 朱丽·沃特斯 / 詹姆斯·克伦威尔 / 玛吉·史密...                                </p>                            </div>                                            </div>    				<div class="info">                        <span class="info_date info_ico">11-13</span>                    	<span class="info_views info_ico">2285</span>                        <span class="info_comment info_ico"><a href="http://www.llduang.com/18336.html#respond">0</a></span>                        <span class="info_category info_ico"><a href="http://www.llduang.com/category/%e6%9c%80%e6%96%b0%e7%94%b5%e5%bd%b1/%e6%ac%a7%e7%be%8e%e7%94%b5%e5%bd%b1" rel="category tag">欧美电影</a></span>     				</div>    		</li>')).to eq('http://www.llduang.com/18336.html')
	end
end