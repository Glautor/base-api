class ErrorMailer < ActionMailer::Base
    default from: Rails.application.secrets.EMAIL_FROM
    layout 'error'

    def error_notification_email(errors:)
        @errors = errors
        mail(subject: "Error Notification Email", to: Rails.application.secrets.EMAIL_ERRORS_RECEIVER)
    end
end