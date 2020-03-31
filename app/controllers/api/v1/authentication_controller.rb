class Api::V1::AuthenticationController < ApplicationController
    before_action :bad_request?

    def access_token
        if authenticated_user?
            render json: { data: Jwt::Token.new.encode(user: user), message: :success }, status: 200
        else
            render json: { message: :unauthorized }, status: 400 # wrong request
        end
    end

    private

    def bad_request?
        if authentication_params[:name].nil? || authentication_params[:password].nil?
            return render json: { message: :bad_request }, status: 400
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
