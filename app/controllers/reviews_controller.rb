class ReviewsController < ApplicationController
	def index
	end
	
	def create
		@review = Review.find(params[:id])
	end

	def new
		@shop = Shop.find(params[:shop_id])
		puts @shop.reviews
		@review = @shop.reviews.build
	end
end
