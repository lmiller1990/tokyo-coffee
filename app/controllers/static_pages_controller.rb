class StaticPagesController < ApplicationController 
  before_action :authenticate_user!, only: [:admin]
  before_action :admin_user, only: [:admin]

  def home
		@shops = Shop.first_four
  end
	
	def admin
		@district = District.new		
		@wards_collection = Ward.all.collect { |w| [ w.japanese_name, w.id ] }
		@unapproved_shops = Shop.all.unapproved
	end
end
