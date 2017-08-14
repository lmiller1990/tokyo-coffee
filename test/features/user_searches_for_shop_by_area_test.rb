require 'test_helper'

class UserSearchesForAShopByAreaTest < Capybara::Rails::TestCase
	test "succesfully searches for shops in an area" do
		visit area_search_path
		click_on '渋谷'
		assert_selector '.shop.item', count: 1
		assert_selector '.shop.item', text: /渋谷にあるお店/
	end
end
