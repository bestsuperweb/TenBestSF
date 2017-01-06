class ContactMailer < ApplicationMailer
  default from: 'SF@10bestnetwork.com'
 
  def welcome_email(user)
    @user = user
    mail(to: @user[:email], subject: @user[:message])
  end
end
