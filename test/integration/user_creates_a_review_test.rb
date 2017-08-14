require 'test_helper'

class UserCreatesAReviewTest < ActionDispatch::IntegrationTest
	def setup
    @shop = shops(:shop_one)
    @district = districts(:district_one)
    @password = "password"
    @user = User.create(email: "#{rand(4000)}@example.com", 
                                  password: @password)
	end

	test "user logs in and creates a review" do
    sign_in(user: @user, password: @password)
		get new_shop_review_path(@shop)
		assert_template 'reviews/new'
		
		assert_difference 'Review.count', 1 do
		post shop_reviews_path, params: {
			shop_id: @shop.id,
			review: {
				comment: 'Some comment'
			}
		}
		end
	end

	test "non authenticated user fails to create a review" do
		get new_shop_review_path(@shop)

		assert_no_difference 'Review.count' do
			post shop_reviews_path, params: {
				shop_id: @shop.id,
				review: {
					comment: 'Some comment'
				}
			}
		end
	end
end
