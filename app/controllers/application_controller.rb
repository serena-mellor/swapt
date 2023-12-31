class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username])
  end

  protected

  def after_sign_in_path_for(resource)
    home_path
  end

  def default_url_options
  { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  # heroku config:set DOMAIN=swapt.shop
  # heroku config:get DOMAIN


end
