class ApplicationController < ActionController::Base
  protect_from_forgery
  def privileges
  	if not current_user.admin?
      flash[:alert] = "Permission Denied!"
      redirect_to root_path
    end
  end
end
