module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_post, only: %w[update destroy show]
      def index
        json(current_user.posts)
      end

      def all
        json(Post.all)
      end

      def show
        json(@post)
      end

      def create
        create_crud(current_user.posts, post_params)
      end

      def update
        update_crud(@post, post_params)
      end

      def destroy
        delete_crud(@post)
      end

      private

      def set_post
        @post = current_user.posts.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:title, :description)
      end
    end
  end
end
