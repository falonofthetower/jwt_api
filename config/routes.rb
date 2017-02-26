Rails.application.routes.draw do
  resources :assignments
  jsonapi_resources :users
  jsonapi_resources :todos
  jsonapi_resources :assignments
  resources :my_assignments
  # devise_for :users
  post 'auth_user' => 'authentication#authenticate'
  get 'home' => 'home#index'
end
