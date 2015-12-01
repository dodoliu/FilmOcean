require 'spec_helper'
require 'film_search_tool/llduang'

RSpec.describe Llduang do
	it "validate max_page_number" do
		llduang = Llduang::Website.new
		# llduang.get_content

		expect(llduang.film_classes).to eq(["传记"])
	end
end