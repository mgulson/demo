Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'home#index'

  resources :users, only: [:index, :create]

  resources :polls, only: [:index, :show, :create]
end
