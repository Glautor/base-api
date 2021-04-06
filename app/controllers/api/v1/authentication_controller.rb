module Api
  module V1
    class AuthenticationController < ApplicationController
      before_action :bad_request?

      def access_token
        raise Utils::Errors::User::Unauthorized unless authenticated_user?
        json(Jwt::Token.new.encode(user.id))
      end

      private

      def bad_request?
        raise ActionController::BadRequest if authentication_params[:email].nil? || authentication_params[:password].nil?
      end

      def authenticated_user?
        user&.authenticate(authentication_params[:password])
      end

      def user
        ::User.find_by_email(authentication_params[:email])
      end

      def authentication_params
        params.require(:authentication).permit(:email, :password)
      end
    end
  end
end
