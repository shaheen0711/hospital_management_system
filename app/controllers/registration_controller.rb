class RegistrationController < ApplicationController
   def index
     @users = User.create(:first_name => "#{params[:first_name]}" , :last_name => "#{params[:last_name]}",  :username => "#{params[:username]}" , :password => "#{params[:password]}") 
   end
end
