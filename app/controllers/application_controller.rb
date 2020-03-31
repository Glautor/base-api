class ApplicationController < ActionController::API
    before_action :verify_access_token, except: :access_token

    def verify_access_token
        current_user.present? ? true : false
    end

    def current_user
        User.find(decoded_token.data)
    end

    private

    def decoded_token
        JWT.decode request[:header][:authorization], Rails.application.secrets.SECRET_HMAC, true, { algorithm: 'HS256' }
    end
end
