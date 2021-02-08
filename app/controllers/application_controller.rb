class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :is_teacher?
  
  

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name, :about])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name, :about])
  end

  def is_teacher?
    current_user && current_user.teacher == true
  end
  
end
