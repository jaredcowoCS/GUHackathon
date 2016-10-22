Rails.application.routes.draw do
  get 'sellers/index'

  root 'pages#home'

  get '/search', to: 'pages#search'

  devise_for :users,
             controllers: { registrations: "registrations" }

  namespace :dashboard do
    get '/', to: 'dashboard#index'
    get '/account', to: 'dashboard#account'

    resources :products
    resources :purchases
  end

  resources :products, only: [:index, :show] do
  	resources :purchases
  end
  resources :balances
  resources :sellers, only: [:index, :show]
end
