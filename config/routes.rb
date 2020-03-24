Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :authentication do
        post :access_token
      end
    end
  end
end