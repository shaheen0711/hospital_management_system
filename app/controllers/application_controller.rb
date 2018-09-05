# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  before_filter { |c| Authorization.current_user = c.current_user }
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    
  end

  private
  # call this as a before_filter to require them to be logged in
  def login_required
    if current_user.nil?
      redirect_to login_users_url, :alert => "You must first log in or sign up before accessing this page."
    end
  end
  
end
