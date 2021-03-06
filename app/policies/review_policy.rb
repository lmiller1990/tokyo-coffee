class ReviewPolicy < ApplicationPolicy
	attr_reader :user, :review

	def initialize(user, review) 
		@user = user
		@review = review
	end

	def update?
		edit?
	end

	def edit?
		review.user == user
	end
end
