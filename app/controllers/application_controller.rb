class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:usermame, :address])
    devise_parameter_sanitizer.permit(:account_update, keys: [:photo, :username])
  end

  def default_url_options
    { host: ENV["https://hidden-gems-lewagon.herokuapp.com/"] || "localhost:3000" }
  end
end
