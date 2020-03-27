module Jwt::Token
    require 'jwt'

    def initialize(user:)
        @payload = { data: user.id }
    end

    def encode
        JWT.encode @payload, Rails.application.SECRET_HMAC, 'HS256' 
    end

    def decode
        JWT.decode @payload, Rails.application.SECRET_HMAC 
    end
end