Rails.application.routes.draw do
  apipie
  resources :activities
  resources :activity_details
  resources :admin_users
  resources :comments
  resources :users, except: [:destroy]

  resource :session, only: [:new, :create, :destroy]
  root to: 'application#welcome'

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      mount_devise_token_auth_for 'User', at: 'auth',
                                  controllers: {
                                      registrations: 'api/v1/registrations',
                                      sessions: 'api/v1/sessions',
                                      omniauth_callbacks: 'api/v1/omniauth_callbacks'
                                  }
      resources :follows, only: [:create, :destroy]
      resources :activities, only: [:index, :create, :show] do
        resources :comments, only: [:create, :destroy, :update]
      end
      post '/upload/:type', to: 'file_upload#upload'
    end
  end
end
