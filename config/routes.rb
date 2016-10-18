Rails.application.routes.draw do
  root 'pages#home'

  get '/dashboard/shop', to: 'dashboard#shop'

  devise_for :users

  namespace :dashboard do
    get '/', to: 'dashboard#index'

    resources :shops do
      resources :products
    end
    resources :products
    resources :balances
  end

  resources :shops do
    resources :products
  end

  resources :products do
    resources :purchases 
  end
  resources :shops, except: [:new, :create, :update]
end
