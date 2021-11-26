class ApplicationController < ActionController::Base
  include Pundit
  #     helper_method :current_user

  rescue_from Pundit::NotAuthorizedError, with: :forbidden

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :current_password, :about_me, :username)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password, :about_me, :username)
    end
  end

  private

  def forbidden
    flash[:alert] = "You are not authorised to perform that acton!"
    # takes you back to where the user was when the request was made
    redirect_to(request.referrer || root_path)
  end
end
