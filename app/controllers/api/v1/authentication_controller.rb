class Api::V1::AuthenticationController < ApplicationController
    before_action :bad_request?

    def access_token
        if authenticated_user?
            json(Jwt::Token.new.encode(user.id))
        else
            raise Utils::Errors::User::Unauthorized
        end
    end

    private

    def bad_request?
        if authentication_params[:name].nil? || authentication_params[:password].nil?
            raise ActionController::BadRequest
        end
    end

    def authenticated_user?
        user&.authenticate(authentication_params[:password])
    end

    def user
        User.find_by_name(authentication_params[:name])
    end

    def authentication_params
        params.require(:authentication).permit(:name, :password)
    end
end
