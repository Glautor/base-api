module Api
  module V1
    module Post
      class CommentsController < ApplicationController
        before_action :set_comment, only: %w[show]
        def index
          json(post.comments)
        end

        def show
          json(@comment)
        end

        private

        def post
          ::Post.find(params[:_id])
        end

        def set_comment
          @comment = post.comments.find(params[:id])
        end

        def comment_params
          params.require(:comment).permit(:content, :status)
        end
      end
    end
  end
end
