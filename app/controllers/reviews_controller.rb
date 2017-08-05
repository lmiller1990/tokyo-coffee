class ReviewsController < ApplicationController
	before_action :authenticate_user!, except: [:show, :index]

	def index
	end
	
	def create
		@shop = Shop.find(params[:shop_id])
		@review = @shop.reviews.build(review_params)
		@review.user = current_user

		if (@review.save)
			flash[:success] = 'Review created'
			redirect_to shop_review_path(@shop, @review)
		else
			render 'new'
		end
	end

	def new
		@shop = Shop.find(params[:shop_id])
		@review = @shop.reviews.build
	end

	def show
		@review = Review.find(params[:id])	
	end

	private

	def review_params
		params.require(:review).permit(:id, :comment, shop_attributes: [:shop_id])
	end
end
