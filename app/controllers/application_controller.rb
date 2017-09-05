class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken

  protect_from_forgery with: :exception, unless: :json_request?
  protect_from_forgery with: :null_session, if: :json_request?
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_user!(opts={})
    opts[:scope] = :user
    warden.authenticate!(opts) if !devise_controller? || opts.delete(:force)
  end

  protected

  def json_request?
    request.format.json?
  end

  def configure_permitted_parameters
    permitted_parameters = devise_parameter_sanitizer.instance_values['permitted']
    attributes = [:name,
                  :nickname,
                  :image,
                  :date_of_birth,
                  :gender,
                  :city,
                  :interest_list]
    attributes.each do |attribute|
      permitted_parameters[:sign_up] << attribute
      permitted_parameters[:sign_in] << attribute
      permitted_parameters[:account_update] << attribute
    end

  end

end