class ApplicationController < ActionController::API
    before_action :verify_access_token, except: :access_token

    def verify_access_token
        hmac_secret = 'my$ecretK3y'
        decoded_token = JWT.decode request[:header][:authorization], hmac_secret, true, { algorithm: 'HS256' }
        return true if User.find(decoded_token.data).present?
        false
    end
end
