class Api::V1::CommentsController < ApplicationController
    def index
        render json: { data: Comment.all, message: :success }, status:200
    end
end
