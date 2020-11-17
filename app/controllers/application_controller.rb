class ApplicationController < ActionController::Base
  before_action :basic_auth if Rails.env.production? 
  before_action :configure_permitted_paraneters, if: :devise_controller?

  private

  def configure_permitted_paraneters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name_chn, :first_name_chn, :last_name_kana, :first_name_kana, :birthday])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username ==  ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
