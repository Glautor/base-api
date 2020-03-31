Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :authentication do
        post :access_token
      end
      namespace :comments do
        get :index
      end
    end
  end
end
