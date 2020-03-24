class Api::V1::CommentsController < ApplicationController
    def index
        render json: Comment.all
    end
end
