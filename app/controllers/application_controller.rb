class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
  	if current_user.admin?
      dashboard_path
    else
      root_path
    end
  end

  def verify_admin
      if !current_user.admin?
      	flash[:danger] = "Unauthorised Action"
      	redirect_to root_path
      end
  end

end
