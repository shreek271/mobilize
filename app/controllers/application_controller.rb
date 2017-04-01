class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :store_current_location, :unless => :devise_controller?

  def store_current_location
    if(request.path != "/users/sign_in" &&
      request.path != "/users/sign_up" &&
      request.path != "/users/password/new" &&
      request.path != "/users/password/edit" &&
      request.path != "/users/confirmation" &&
      request.path != "/users/sign_out" &&
      !request.xhr? && !current_user) # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end


  def after_sign_in_path_for(resource)
    previous_path = session[:previous_url]
    session[:previous_url] = nil
  	if current_user.admin?
      dashboard_path
    else
      previous_path || root_path
    end
  end
  
  def verify_admin
    if !current_user.admin?
    	flash[:danger] = "Unauthorised Action"
    	redirect_to root_path
    end
  end

end
