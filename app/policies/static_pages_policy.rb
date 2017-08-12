class StaticPagesPolicy < ApplicationPolicy
	attr_reader :user, :review

	def initialize(user, review) 
	end

	def update?
	end

	def edit?
	end
end
