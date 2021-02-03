module Api
  module V1
    module User
      class PostsController < ApplicationController
        before_action :set_post, only: %w[show]
        def index
          json(@post)
        end

        private

        def user
          ::User.find(params[:_id])
        end

        def set_post
          @post = user.posts.find(params[:id])
        end
      end
    end
  end
end
