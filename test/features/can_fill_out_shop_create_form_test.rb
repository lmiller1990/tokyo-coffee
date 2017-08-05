require "test_helper"

class CanFillOutShopCreateFormTest < Capybara::Rails::TestCase
	def setup
		@district = districts(:district_one)
		@password = "password"
		@confirmed_user = User.create(email: "#{rand(4000)}@example.com",
																	password: @password,
																	admin: true)
	end

	test "user can fill out and submit form to create shop" do
		assert_difference 'Shop.count', 1 do
			visit new_user_session_path
			puts body
			fill_in 'user[email]', with: @confirmed_user.email
			fill_in 'user[password]', with: @confirmed_user.password
			click_on 'Log in'
			visit new_shop_path
			fill_in 'shop[japanese_name]', with: 'japanese name of shop'
			select @district.japanese_name, from: 'shop[district_id]'
			click_button 'Register Cafe'
		end
	end
end