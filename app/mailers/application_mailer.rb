class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.secrets.EMAIL_FROM
  layout 'mailer'
end
