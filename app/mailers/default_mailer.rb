class DefaultMailer < ApplicationMailer
  default from: Rails.application.secrets.SMTP_DOMAIN

  def welcome_email(user:)
    @user = user
    mail(subject: "Welcome Email", to: @user.email)
  end
end
