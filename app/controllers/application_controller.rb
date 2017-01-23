class ApplicationController < ActionController::Base
  include Godmin::ApplicationController
  include Godmin::Authentication
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :null_session, if: -> { request.format.json? }
  protect_from_forgery with: :exception

  def admin_user_class
    AdminUser
  end

  def authenticate_admin_user
    unless admin_user_signed_in? || controller_name == 'sessions'
      if devise_controller?
        authenticate_user!
      else
        redirect_to new_session_path, alert: 'Authentication needed'
      end
    end
  end

  def authenticate_user!(opts={})
    opts[:scope] = :user
    warden.authenticate!(opts) if !devise_controller? || opts.delete(:force)
  end

end