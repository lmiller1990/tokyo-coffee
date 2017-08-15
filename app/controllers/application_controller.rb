class ApplicationController < ActionController::Base
	include Pundit
  protect_from_forgery with: :exception
	
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	private

	def user_not_authorized
		flash[:alert] = "You are not authorized to do this action."
		redirect_to(request.referrer || root_path)
	end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
