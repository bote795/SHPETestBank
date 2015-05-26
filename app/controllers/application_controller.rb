class ApplicationController < ActionController::Base
  protect_from_forgery
  def privileges
  	if not current_user.admin?
      flash[:alert] = "Permission Denied!"
      redirect_to root_path
    end
  end
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || totals_test_entries_path
  end
end
