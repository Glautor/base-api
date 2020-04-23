module Jwt
  class Token
    def encode(data)
      payload = { data: data }
      JWT.encode payload, Rails.application.secrets.SECRET_HMAC, 'HS256'
    end

    def decode(token:)
      JWT.decode(token, Rails.application.secrets.SECRET_HMAC, true, { algorithm: 'HS256' }).first
    end
  end
end
