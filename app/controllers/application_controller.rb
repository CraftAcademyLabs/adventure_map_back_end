class ApplicationController < ActionController::Base
  include Godmin::ApplicationController
  include Godmin::Authentication
  include Godmin::Authorization
  include DeviseTokenAuth::Concerns::SetUserByToken

  protect_from_forgery with: :exception, unless: :json_request?
  protect_from_forgery with: :null_session, if: :json_request?
  before_action :configure_permitted_parameters, if: :devise_controller?


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

  # protected
  #
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :nickname, :image])
  # end
  #
  # def json_request?
  #   request.format.json?
  # end

end