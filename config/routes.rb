Rails.application.routes.draw do
  get 'products/index'

  get 'products/new'

  get '/dashboard', to: 'dashboard#index'

  root 'pages#home'

  devise_for :users
  
  resources :shops do
  	resources :products
  end

  resources :products
end
