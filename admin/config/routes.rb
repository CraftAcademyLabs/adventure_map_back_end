Admin::Engine.routes.draw do


  resources :activities
  resources :activity_details
  resources :admin_users
  resources :comments
  resources :users, except: [:destroy]

  resource :session, only: [:new, :create, :destroy]
  root to: 'admin#welcome'


end
