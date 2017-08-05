require "test_helper"

class UserEditsAReviewTest < Capybara::Rails::TestCase
	def setup
		@shop = shops(:shop_one)
		@user = users(:regular_user)
		@review = reviews(:review_one)
	end

	test "user can fill out and submit form to create shop" do
		visit new_user_session_path
		fill_in 'user[email]', with: @user.email
		fill_in 'user[password]', with: 'password'
		click_on 'Log in'
		visit edit_shop_review_path(@shop, @review)
		fill_in 'review[comment]', with: 'Updated comment'
		click_button 'Update Review'
		@review.reload
		assert_equal @review.comment, 'Updated comment'
	end
end
