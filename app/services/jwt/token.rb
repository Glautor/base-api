module Jwt
    class Token
        def initialize(user:)
            @payload = { data: user }
        end

        def encode
            JWT.encode @payload, Rails.application.secrets.SECRET_HMAC, 'HS256'
        end

        def decode
            JWT.decode @payload, Rails.application.secrets.SECRET_HMAC, false
        end
    end
end