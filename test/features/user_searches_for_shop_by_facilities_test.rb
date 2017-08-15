require 'test_helper'

class UserSearchesForShopByFacilitiesTest < Capybara::Rails::TestCase
	def setup
		@shop_without_coffee = shops(:shop_without_coffee)
		@coffee = facilities(:coffee)
	end
	test 'finds shops with coffee only' do
		# that's not a very good shop if it doesnt have coffee.
		visit work_search_path
		page.find("#facility_id_#{@coffee.id}").set(true)
		click_on '検索'
		puts body

		assert_selector '.header.shop.name', @shop_without_coffee.japanese_name, count: 0
	end
end
