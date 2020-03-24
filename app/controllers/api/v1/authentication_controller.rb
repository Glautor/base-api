class Api::V1::AuthenticationController < ApplicationController
    require 'jwt'

    def access_token
        raise 'user_not_found' unless User.find_by_name(authentication_params[:name])
        if current_user
            payload = { data: current_user.id }
            token = JWT.encode payload, Rails.application.secrets.SECRET_HMAC, 'HS256'
            render json: token
        else
            render json: 'Wrong password'
        end
    end

    private

    def current_user
        User.find_by_name(authentication_params[:name]).authenticate(authentication_params[:password])
    end

    def authentication_params
        params.require(:authentication).permit(:name, :password)
    end
end
