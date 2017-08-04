class ShopsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :new, :destroy]
  before_action :admin_user, only: [:destroy]

  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update_attributes(shop_params)
      flash[:success] = "#{@shop.name} updated." 
      redirect_to @shop
    else
      render 'edit'
    end
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      flash[:success] = "Thank you for registering #{@shop.name}."
      redirect_to @shop
    else
      render 'new'
    end
  end

  def destroy
    shop = Shop.find(params[:id]).destroy
    flash[:success] = "#{shop.name} deleted."
    redirect_to shops_url
  end

  private

  def shop_params
    params.require(:shop).permit(:name)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
