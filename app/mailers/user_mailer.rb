class UserMailer < ActionMailer::Base
  default from: "abhishekkumar1990it@gmail.com"

  def email_for_new_user(user)
    @user = user
    mail(to: @user.email, subject: 'Thanks for subscribing')
  end

end
