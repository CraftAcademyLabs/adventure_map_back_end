class Api::V1::RegistrationsController < DeviseTokenAuth::RegistrationsController

  # Defining params for APIs - exported into ApiPie docs at /apidocs
  def_param_group :user do
    param :user, Hash, :required => true do
      param :name, String, 'Name of the user'
      param :nickname, String, 'Nickname of the user'
      param :email, String, 'User email'
      param :password, String, 'User password'
      param :password_confirmation, String, 'User password confirmation'
    end
  end
  api :POST, '/auth/user', 'Create a user'
  param_group :user

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :nickname, :image])
  end

  def json_request?
    request.format.json?
  end

end