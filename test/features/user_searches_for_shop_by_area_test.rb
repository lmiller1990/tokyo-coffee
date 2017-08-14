require 'test_helper'

class UserSearchesForAShopByAreaTest < Capybara::Rails::TestCase
	def setup
	end

	test "succesfully searches for shops in an area" do
		visit area_search_path
		puts body
		click_on '渋谷'
		skip('TODO: Implement this.')
	end
end
