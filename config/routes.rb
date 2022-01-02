Rails.application.routes.draw do
  get 'users/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      # root 'houses#index'
      resources :users     
      post 'signup', to: 'users#create'
      post 'login', to: 'authentication#create'
      resources :houses, only: %i[index show]
      resources :favourites, only: %i[index create destroy]
    end
  end
end
