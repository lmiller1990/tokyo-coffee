class DistrictsController < ApplicationController
  before_action :admin_user

	def create
		puts 'Creating', district_params
		@district = District.new(district_params)

		if @district.save
			flash[:success] = "エリアを作成した." 
      redirect_to admin_path
    else
      redirect_to admin_path
    end
	end

	private

	def district_params
    params
			.require(:district)
			.permit(:id, 
							:japanese_name, 
							:ward_id)
	end
end
