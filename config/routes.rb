Rails.application.routes.draw do
  root 'pages#home'

  get '/dashboard', to: 'dashboard#index'
  get '/dashboard/shop', to: 'dashboard#shop'

  devise_for :users

  namespace :dashboard do
    resources :shops do
      resources :products
    end
    resources :products
  end

  resources :shops do
    resources :products
  end

  resources :products do
    resources :purchases 
  end
  resources :shops
end
