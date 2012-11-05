class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :avatar_url

  def avatar_url
    "http://gravatar.com/avatar/#{Digest::MD5.new.update('josemarluedke@gmail.com')}.jpg?s=220"
  end

  protected
  def render_404
    raise ActionController::RoutingError.new('Not Found')
  end
end

