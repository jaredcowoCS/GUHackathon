Rails.application.routes.draw do
  root 'pages#home'

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
end
