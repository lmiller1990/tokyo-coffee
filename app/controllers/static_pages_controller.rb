class StaticPagesController < ApplicationController 
  # before_action :authenticate_user!

  def home
		@shops = Shop.first_four
  end
end
