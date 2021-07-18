class PassengerMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def confirmation_email
    @user = params[:user]
    @url = 'https://example.com/login'
    mail(to: @user.email, subject: 'Booking successfully received')
  end
end
