class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_user(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
