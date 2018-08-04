class UsersController < ApplicationController
  
  before_filter :login_required, :except => [:login, :signup, :change_password, :update_password]

  def index
     @user = @current_user
  end

  #  def new
  #    @users = User.find(2)
  #    respond_to do |format|
  #      format.html # new.html.erb
  #      format.xml  { render :xml => @users }
  #    end
  #  end
  #  def show
  #    @users = User.find(params[:id])
  #    respond_to do |format|
  #      format.html # show.html.erb
  #      format.xml  { render :xml => @users }
  #    end 
  #  end

  def login
    if request.post?
      user = User.authenticate(params[:user])
      if user.present?
        session[:user_id] = user.id
        puts session[:user_id].inspect
        redirect_to users_path
      else
        flash.now[:notice] = "Invalid Username or password."         #, :text => "Invalid Username or password.",  :layout => true
      end
    else
    end    
  end
  
  def logout    
    reset_session
    redirect_to users_path
  end
  
  def signup
    if request.post?
      @users = User.create(:first_name => "#{params[:first_name]}" , :last_name => "#{params[:last_name]}",  :username => "#{params[:username]}" , :password => "#{params[:password]}") 
      if @user
        session[:user_id] = @user.id
        redirect_to users_path
      end
    else
      
    end
    
   
  end
  def change_password
    @user = User.find(params[:id])
  end

  #Action to update changed password into the database.
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


  #  def update
  #    @user = User.find(params[:id])
  #    respond_to do |format|
  #      if @user.update_attributes(params[:user])
  #        flash[:notice] = 'User details was successfully updated.'
  #        format.html { redirect_to(@user) }
  #        format.xml  { head :ok }
  #      else
  #        format.html { render :action => "edit" }
  #        format.xml  { render :xml => @user.errors,
  #          :status => :unprocessable_entity }
  #      end
  #    end
  #  end
  
  #  def destroy
  #    @users = User.find(params[:id])
  #    @users.destroy
  #
  #    respond_to do |format|
  #      format.html { redirect_to(users_url) }
  #      format.xml  { head :ok }
  #    end
  #  end
  # 
 
end