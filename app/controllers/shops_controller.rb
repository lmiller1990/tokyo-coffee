require 'uri'

class ShopsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :new, :destroy]
  before_action :admin_user, only: [:destroy]

  def index
		district_id = params[:area]	
		if district_id.nil?
			@shops = Shop.approved
		else
			@shops = Shop.in_area(district_id).approved
		end
  end

  def show
    @shop = Shop.find(params[:id])
		@review = Review.new(user: current_user, shop: @shop)
  end

  def edit
    @shop = Shop.find(params[:id])
		@districts = District.all.collect { |d| [ d.japanese_name, d.id ] }
  end

  def update
		referrer = URI(request.referrer).path
    @shop = Shop.find(params[:id])

    if @shop.update_attributes(shop_params)
      flash[:success] = "#{@shop.japanese_name} updated."
			if (referrer == '/admin')
				redirect_to admin_path
			else
				redirect_to @shop
			end
    else
      render 'edit'
    end
  end

  def new
    @shop = Shop.new
		@districts = District.all.collect { |d| [ d.japanese_name, d.id ] }
  end

  def create
    @shop = Shop.new(shop_params)

    if @shop.save
			flash[:success] = "Thank you for registering." 
      redirect_to @shop
    else
      render 'new'
    end
  end

  def destroy
    shop = Shop.find(params[:id]).destroy
    flash[:success] = "#{shop.japanese_name} deleted."
    redirect_to shops_url
  end

  private

  def shop_params
    params
			.require(:shop)
			.permit(:id, 
							:japanese_name, 
							:station, 
							:description, 
							:registration_approved,
							:district_id,
							{ facility_ids: [] })
  end
end
