require "test_helper"

class UserEditsAReviewTest < Capybara::Rails::TestCase
	def setup
		@shop = shops(:shop_one)
		@user = users(:regular_user)
		@review = reviews(:review_one)
		@another_user = users(:another_user)
	end

	test "user can edit his own review" do
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

	test "a user cannot edit another user's review" do
		visit new_user_session_path
		fill_in 'user[email]', with: @another_user.email
		fill_in 'user[password]', with: 'password'
		click_on 'Log in'
		visit edit_shop_review_path(@shop, @review)

		assert_current_path '/'
		assert_selector '.alert.message', text: /not authorized/
	end
end
