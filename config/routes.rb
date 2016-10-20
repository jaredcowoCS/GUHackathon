Rails.application.routes.draw do
  namespace :dashboard do
  get 'purchases/index'
  end

  root 'pages#home'

  devise_for :users,
             controllers: { registrations: "registrations" }

  namespace :dashboard do
    get '/', to: 'dashboard#index'

    resources :products
    resources :purchases
  end

  resources :products, only: [:index, :show] do
  	resources :purchases
  end
  resources :balances
end
