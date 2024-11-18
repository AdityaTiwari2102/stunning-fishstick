Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  namespace :api do
    namespace :v1 do
      resources :groups, only: %i[index]
      resources :posts, only: %i[index create] do
        member do
          post :comment
          patch :claps
        end
      end
      resources :users, only: %i[index]
    end
  end

  require "sidekiq/web"
  mount Sidekiq::Web => "/sidekiq"
end
