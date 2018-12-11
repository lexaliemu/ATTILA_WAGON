class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :username, :first_name, :last_name) }
    # devise_parameter_sanitizer.permit(:account_update) { |u| u.permit( :first_name, :last_name, :age, :country, :biography, :email, :password, :current_password, :photo, :photo_cache, :remove_avatar) }
  end

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end
end


