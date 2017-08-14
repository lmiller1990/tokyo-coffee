require "test_helper"

class AdminUpdatesShopDistrictTest < Capybara::Rails::TestCase
	def setup
		@password = "password"
		@confirmed_user = User.create(email: "#{rand(4000)}@example.com",
																	password: @password,
																	admin: true)
	end

	test "admin updates district of a shop through admin page" do
		visit new_user_session_path
		fill_in 'user[email]', with: @confirmed_user.email
		fill_in 'user[password]', with: @confirmed_user.password
		click_on 'Log in'

		visit admin_path
		skip "TODO"
	end
end

