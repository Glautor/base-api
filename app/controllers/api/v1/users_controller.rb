module Api
  module V1
    class UsersController < ApplicationController
      before_action :validate_admin, except: %w[index show]
      before_action :set_user, only: %w[update destroy show]
      def index
        json(User.all)
      end

      def show
        json(@user)
      end

      def create
        create_crud(current_user.users, user_params)
      end

      def update
        update_crud(@user, user_params)
      end

      def destroy
        delete_crud(@user)
      end

      private

      def validate_admin
        raise Utils::Errors::User::Unauthorized unless current_user.admin?
      end

      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:content, :status)
      end
    end
  end
end
