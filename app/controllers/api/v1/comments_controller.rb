class Api::V1::CommentsController < ApplicationController
    before_action :set_comment, only: %w[update destroy]
    def index
        json(current_user.comments)
    end

    def create
        model_create(current_user.comments, comment_params)
    end

    def update
        model_update(@comment, comment_params)
    end

    def destroy
        model_delete(@comment)
    end

    private

    def set_comment
        @comment = current_user.comments.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:content)
    end
end
