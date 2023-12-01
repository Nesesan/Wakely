Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"


  resources :posts, only: %I[index show create] do
    resources :comments, only: %i[create]
    resources :reactions, only: %i[create destroy]
  end
  resources :users
  resources :comments, only: [:destroy]
  resources :reactions, only: [:destroy]
  resources :posts, only: [:destroy]

  get 'search_music', to: "posts#search_music"
end
