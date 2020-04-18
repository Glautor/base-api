module Api
  module V1
    class AuthenticationController < ApplicationController
      before_action :bad_request?

      def access_token
        if authenticated_user? return json(Jwt::Token.new.encode(user.id))
        raise Utils::Errors::User::Unauthorized
      end

      private

      def bad_request?
        unless authentication_params[:email].nil? || authentication_params[:password].nil?; return
        raise ActionController::BadRequest
      end

      def authenticated_user?
        user&.authenticate(authentication_params[:password])
      end

      def user
        User.find_by_email(authentication_params[:email])
      end

      def authentication_params
        params.require(:authentication).permit(:email, :password)
      end
    end
  end
end
