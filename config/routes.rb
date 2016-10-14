Rails.application.routes.draw do
  get '/dashboard', to: 'dashboard#index'

  root 'pages#home'

  devise_for :users
  
  resources :shops
end
