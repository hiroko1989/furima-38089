class ApplicationController < ActionController::Base

  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["FURIMA_USER"] && password == ENV["FURIMA_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:birth_date ,:nickname,:family_name,:first_name,:ruby_family_name, :ruby_first_name])
  end

end
