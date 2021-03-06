class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :is_teacher?
  helper_method :is_teacher_profile?
  before_action :categories_navbar

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || feed_path
  end

  
  def categories_navbar
    @cat_navbar = Category.where(display_in_navbar: true)
  end

  def categories
    @categories = Category.all
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name, :about])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :about])
  end

  def is_teacher?
    current_user && current_user.teacher === true
  end
  
  def is_teacher_profile?
    @user.teacher === true
  end

end
