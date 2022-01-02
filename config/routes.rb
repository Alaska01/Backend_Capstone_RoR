Rails.application.routes.draw do
  get 'users/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      #add a root resource here later
      # post "/login", to: "users#login"
      # get "/auto_login", to: "users#auto_login"
      resources :users
      # resources :houses
      # resources :favourites
      # get '/users/:id', to: 'users#import1'
      root 'houses#index'
      post 'signup', to: 'users#create'
      post 'login', to: 'authentication#create'
      resources :houses, only: %i[index show]
      resources :favourites, only: %i[index create destroy]
    end
  end
end
