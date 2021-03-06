class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def store_current_location
    store_location_for(:user, request.url)
  end

  def after_sign_in_path_for(resource_or_scope)
    user_path(current_user)
  end

  def after_sign_out_path_for(resource_or_scope)
    request.referrer
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :birth_date])
  end
end
