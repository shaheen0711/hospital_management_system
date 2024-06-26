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
         flash[:notice] = "Welcome, you successfully logged in." 
        redirect_to users_path
      else
        flash.now[:notice] = "Invalid Username or password."       
      end
    else
      p "000"
    end    
  end
  
  def logout    
    reset_session
    redirect_to users_path
  end
 
  def admin_profile
    @user = @current_user
    
  end
   
  def change_password
    @user = User.find(params[:id])
  end

 
  def update_password
    @user = User.find(params[:id])
    if ((params[:user][:password]).blank? || (params[:user][:password_confirmation]).blank?)
      @user.errors[:base] = t(:password_blank, :scope => :messages)
      render 'change_password'
    elsif ((params[:user][:password]) != (params[:user][:password_confirmation]))
      @user.errors[:base] = t(:password_mismatch, :scope => :messages)
      render 'change_password'
    elsif @user.update_attribute(:password, params[:user][:password])
      sign_in @user
      redirect_to @user, :flash => {:success => t(:updated, :scope => :messages)}
    else
      render 'change_password'
    end
  end


  
 
end
