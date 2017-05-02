class Api::V1::OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController

  def assign_provider_attrs(user, auth_hash)
    user.assign_attributes({
                               nickname: auth_hash['info']['first_name'],
                               name: auth_hash['info']['name'],
                               image: auth_hash['info']['image'],
                               email: auth_hash['info']['email']
                               # interest_list: auth_hash['info']['interest_list']
                           })
  end

#   def get_resource_from_auth_hash
#     # find or create user by provider and provider uid
#     @resource = resource_class.where({
#                                          uid:      auth_hash['uid'],
#                                          provider: auth_hash['provider']
#                                      }).first_or_initialize
#
#     if @resource.new_record?
#       @oauth_registration = true
#       set_random_password
#     end
#
#     # sync user info with provider, update/generate auth token
#     assign_provider_attrs(@resource, auth_hash)
#
#     # assign any additional (whitelisted) attributes
#     extra_params = whitelisted_params.merge(interest_list: @resource.interest_list)
#     @resource.assign_attributes(extra_params) if extra_params
# binding.pry
#     @resource
#   end
#
#   def whitelisted_params
#     whitelist = params_for_resource(:sign_up)
#
#     whitelist.inject({}){|coll, key|
#       param = omniauth_params[key.to_s]
#       if param
#         coll[key] = param
#       end
#       coll
#     }
#   end

  def render_data(message, data)
    user = resource_class.find_by(email: data['email'])
    @data = data.merge({
                           message: message,
                           interest_list: user.interest_list
                       })
    render :layout => nil, :template => "devise_token_auth/omniauth_external_window"
  end

end