Rails.application.routes.draw do
  devise_for :users
 
  root "home#index"
  namespace :properties do
    resources :search, only: [:index]
  end
  resources :properties, only: [:show] do
    resources :reservations, only: [:new], controller: "properties/reservations"
  end
  resources :reservation_payments, only: [:create]
  resources :profiles, only: [:show, :update]
  resources :accounts, only: [:show, :update]
  resources :passwords, only: [:show, :update]
  resources :payments, only: [:index]
  namespace :api do 
  resources :users, only: [:show]
  resources :favroutes, only: [:create, :destroy]
  get "/users_by_email" => "users_by_emails#show", as: :users_by_email
  end
  put '/hostify/:user_id', to: 'hostify#update', as: 'hostify'
  namespace :host do
    get '/dashboard '=> 'dashboard#index', as: :dashboard
    resources :properties, only: [:new, :create]
    resources :payments, only: [:index]
  end
 
end
