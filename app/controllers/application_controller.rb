class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  force_ssl if: :ssl_configured?

  auth_name = ENV['AUTH_NAME'] || 'name'
  auth_password = ENV['AUTH_PASSWORD'] || SecureRandom.hex
  http_basic_authenticate_with name: auth_name, password: auth_password

  def ssl_configured?
    !Rails.env.development?
  end
end
