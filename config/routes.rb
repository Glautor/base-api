Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    namespace :v1 do
      namespace :authentication do
        post :access_token
      end
      resources :comments, only: [:index, :create, :update, :destroy]
      resources :posts, only: [:index, :create, :update, :destroy]
      namespace :posts do
        get :all
      end

      namespace :post do
        resources do
          resources :comments, only: [:index, :show]
        end
      end
    end
  end
end
