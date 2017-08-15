require "test_helper"

class UserCreatesAReviewOnShopShopPageTest < Capybara::Rails::TestCase
	def setup
		@shop = shops(:shop_without_coffee)
		@password = "password"
		@confirmed_user = User.create(email: "#{rand(4000)}@example.com",
																	password: @password,
																	admin: true)
	end

	test "user can fill out and submit form to create shop" do
		review_comment = 'This place has great coffee but no wifi'
		visit new_user_session_path
		fill_in 'user[email]', with: @confirmed_user.email
		fill_in 'user[password]', with: @confirmed_user.password
		click_on 'Log in'

		assert_difference 'Review.count', 1 do
			visit shop_path(@shop)
			fill_in 'review[comment]', with: review_comment
			click_button '投稿'
		end
	end
end
