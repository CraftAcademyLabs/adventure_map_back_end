class Api::V1::OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController

  def assign_provider_attrs(user, auth_hash)
    user.assign_attributes({
                               nickname: auth_hash['info']['first_name'],
                               name: auth_hash['info']['name'],
                               image: auth_hash['info']['image'],
                               email: auth_hash['info']['email']
                           })
  end

  def render_data(message, data)
    user = resource_class.find_by(email: data['email'])
    @data = data.merge({
                           message: message,
                           interest_list: user.interest_list
                       })
    render :layout => nil, :template => "devise_token_auth/omniauth_external_window"
  end

end