class Api::V1::CommentsController < ApplicationController
    before_action :set_comment, only: %w[update delete]
    def index
        json(current_user.comments)
    end

    def create
        create(Comment.new, comment_params)
    end

    def update
        update(@comment, comment_params)
    end

    def delete
        delete(@comment)
    end

    private

    def set_comment
        @comment = Comment.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:content, :user_id)
    end
end
