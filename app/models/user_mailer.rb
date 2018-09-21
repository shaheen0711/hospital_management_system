class UserMailer < ActionMailer::Base
  
  def welcome_email(user)
    @receipients =  "sghazala79@gmail.com"
    @from        =  "snaa0711@gmail.com"
    @subject     =  "Welcome to My Awesome Site"
    @sent_on     =  Time.now
    @user = user
  end  

end
