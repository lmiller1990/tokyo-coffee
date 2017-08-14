require 'test_helper'

class UserViewsAllShopsTest < Capybara::Rails::TestCase
	def setup
	end

	test "User navigates to shop index and views all registration approved shops" do
		visit shops_path
		assert_selector '.shop.item', count: 2
	end
end
