class Api::V1::OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController

  def assign_provider_attrs(user, auth_hash)
    user.assign_attributes({
                               nickname: auth_hash['info']['first_name'],
                               name: auth_hash['info']['name'],
                               image: auth_hash['info']['image'],
                               email: auth_hash['info']['email']
                           })
  end


end