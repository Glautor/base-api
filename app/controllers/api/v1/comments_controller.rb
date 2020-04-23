module Api
  module V1
    class CommentsController < ApplicationController
      before_action :set_comment, only: %w[update destroy]
      def index
        json(current_user.comments)
      end

      def create
        create_crud(current_user.comments, comment_params)
      end

      def update
        update_crud(@comment, comment_params)
      end

      def destroy
        delete_crud(@comment)
      end

      private

      def set_comment
        @comment = current_user.comments.find(params[:id])
      end

      def comment_params
        params.require(:comment).permit(:content)
      end
    end
  end
end
