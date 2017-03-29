Rails.application.routes.draw do
  resources :assignments
  jsonapi_resources :users, except: :create
  jsonapi_resources :todos
  jsonapi_resources :assignments
  resources :my_assignments
  resources :my_requests
  devise_for :users, :controllers => {:registrations => "registrations"}
  post 'auth_user' => 'authentication#authenticate'
  get 'home' => 'home#index'
end
