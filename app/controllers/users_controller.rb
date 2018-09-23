class UsersController < ApplicationController
  
  before_filter :login_required, :except => [:login, :signup, :change_password, :update_password, :logout ]  

  def index
    @user = @current_user
  end

  def login
    if request.post?
      user = User.authenticate(params[:user])
      if user.present?
        session[:user_id] = user.id
        redirect_to users_path
        flash[:notice] = "Welcome #{user.first_name} ,you have successfull logged in." 
       
      else
        flash.now[:notice] = "Invalid Username or password."       
      end
    else
    end    
  end
  
  def logout    
    reset_session
    redirect_to users_path
  end
 
  def admin_profile
    @user = @current_user
  end
  
end
