class ApplicationController < ActionController::Base
  helper :all
  before_action :set_authorization_user
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
  end

  def login_required
    return if current_user.present?

    redirect_to login_users_path, alert: "You must first log in or sign up before accessing this page."
  end

  private

  def set_authorization_user
    @current_user = current_user
    Authorization.current_user = @current_user if defined?(Authorization)
  end
end
