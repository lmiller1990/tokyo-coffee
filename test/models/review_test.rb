require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
	def setup
		@shop = shops(:shop_no_reviews) 
		@user = users(:admin_user)
		@first_review = @shop.reviews.create(user: @user, comment: "Last year", created_at: 1.year.ago)
		@second_review = @shop.reviews.create(user: @user, comment: "Yesterday", created_at: 1.day.ago)
		@third_review = @shop.reviews.create(user: @user, comment: "Tomorrow", created_at: 1.day.since)

	end

	test "reviews should be shown in reverse chronological order" do
		correct_order = [@third_review, @second_review, @first_review]

		assert_equal correct_order, @shop.reviews.order_by_most_recent 
	end
end
