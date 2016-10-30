Rails.application.routes.draw do

  namespace :dashboard do
  get 'orders/index'
  end

  root 'pages#home'
  get '/features', to: 'pages#features'

  devise_for :users,
             controllers: { registrations: "registrations" }

  namespace :dashboard do
    get '/', to: 'dashboard#index'
    get '/account', to: 'dashboard#account'

    resources :products
    resources :purchases
    resources :users
    resources :orders
  end

  resources :products, only: [:index, :show] do
  	resources :purchases
  end
  resources :balances
  resources :sellers, only: [:index, :show]

end
