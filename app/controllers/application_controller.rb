class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :avatar_url
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def avatar_url
    "http://gravatar.com/avatar/#{Digest::MD5.new.update('josemarluedke@gmail.com')}.jpg?s=190"
  end

  protected
  def render_404
    raise ActionController::RoutingError.new('Not Found')
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) << [:email]
    devise_parameter_sanitizer.for(:sign_up) << [:email, :name]
    devise_parameter_sanitizer.for(:account_update) << [:name, :email, :password, :password_confirmation]
  end
end

