class StaticPagesController < ApplicationController 
  before_action :authenticate_user!, only: [:admin]
  before_action :admin_user, only: [:admin]

  def home
		@shops = Shop.first_four
  end
	
	def admin
		@district = District.new		
		@wards_collection = Ward.all.collect { |w| [ w.japanese_name, w.id ] }
		@districts = District.all.collect { |d| [ d.japanese_name, d.id ] }
		@unapproved_shops = Shop.all.unapproved
	end

	def area_search
		@districts = District.all
	end

	def work_search
		@shop_filter = ShopFilter.new
		@facilities = Facility.all
		@facilities_collection = Facility.all.collect { |d| [ d.name, d.id ] }
	end
end
