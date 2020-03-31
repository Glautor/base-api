module Jwt
    class Token
        def encode(user:)
            payload = { data: user.id }
            JWT.encode payload, Rails.application.secrets.SECRET_HMAC, 'HS256'
        end

        def decode(token:)
            JWT.decode token, Rails.application.secrets.SECRET_HMAC, true, { algorithm: 'HS256' }
        end
    end
end