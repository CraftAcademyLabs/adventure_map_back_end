Rails.application.routes.draw do
  apipie
  resources :activities
  resources :admin_users
  resources :users, except: [:destroy]

  resource :session, only: [:new, :create, :destroy]
  root to: 'application#welcome'

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth',
                                  controllers: {
                                      registrations: 'api/v1/registrations',
                                      omniauth_callbacks: 'api/v1/omniauth_callbacks'
                                  }
    end
  end
end
