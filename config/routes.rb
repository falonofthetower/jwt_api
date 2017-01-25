Rails.application.routes.draw do
  jsonapi_resources :users
  jsonapi_resources :todos
  # devise_for :users
  post 'auth_user' => 'authentication#authenticate_user'
  get 'home' => 'home#index'
end
