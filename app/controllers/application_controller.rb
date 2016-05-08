class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/', :alert => exception.message
  end

  def after_sign_in_path_for(resource)
    unless current_user.roles.first.nil?
      case current_user.roles.first.name
        when "admin"
	        rails_admin_path
        when "user"
          record_info_path
      end
    else
      root_path
    end
  end
end
