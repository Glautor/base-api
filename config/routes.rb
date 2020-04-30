Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    namespace :v1 do
      namespace :authentication do
        post :access_token
      end
      resources :comments, only: [:index, :create, :update, :destroy]
    end
  end
end
