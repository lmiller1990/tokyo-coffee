require 'test_helper'

class AdminApprovesShopRegistrationTest < Capybara::Rails::TestCase
	def setup
		@admin = users(:admin_user)
		@unapproved_shop = shops(:unapproved_shop)
	end

	test "admin can approve a shop" do
		visit new_user_session_path
		fill_in 'user[email]', with: @admin.email
		fill_in 'user[password]', with: 'password'
		click_on 'Log in'
		visit admin_path
		assert_difference 'Shop.all.unapproved.count', -1 do
			# stuff here.
		end
	end
end
