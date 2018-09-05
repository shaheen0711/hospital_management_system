class UserMailer < ActionMailer::Base
  
  def welcome_email(user)
#    recipients    "snaa0711@gmail.com"
#    from          "sghazala79@gmail.com"
    @receipients =  "sghazala79@gmail.com"
    @from        =  "snaa0711@gmail.com"
    @subject     =  "Welcome to My Awesome Site"
    @sent_on     =  Time.now
    @user = user #:url => "http://example.com/login"
  end  

end
