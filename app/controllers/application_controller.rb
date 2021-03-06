class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  rescue
    render_404
  end

  def render_404
    render file: "./public/404.html", status: :not_found
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :avatar])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :avatar])
  end
end
