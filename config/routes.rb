Rails.application.routes.draw do
  apipie
  resources :activities
  resources :activity_details
  resources :admin_users
  resources :users, except: [:destroy]

  resource :session, only: [:new, :create, :destroy]
  root to: 'application#welcome'

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth',
                                  controllers: {
                                      registrations: 'api/v1/registrations',
                                      sessions: 'api/v1/sessions',
                                      omniauth_callbacks: 'api/v1/omniauth_callbacks'
                                  }
      resources :activities, only: [:create]
    end
  end
end
