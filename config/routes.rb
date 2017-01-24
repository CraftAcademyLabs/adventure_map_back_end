Rails.application.routes.draw do
  resources :activities
  resources :admin_users
  resources :users, except: [:destroy]

  resource :session, only: [:new, :create, :destroy]
  root to: 'application#welcome'

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
    end
  end
end
