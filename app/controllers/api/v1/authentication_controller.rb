class Api::V1::AuthenticationController < ApplicationController
    def access_token
        return render json: 'user not found' unless User.find_by_name(authentication_params[:name])
        if current_user
            render json: Jwt::Token.new(user: current_user).encode
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
