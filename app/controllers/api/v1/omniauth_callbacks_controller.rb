class Api::V1::OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController

  def omniauth_success
    get_resource_from_auth_hash
    create_token_info
    set_token_on_resource
    create_auth_params

    if resource_class.devise_modules.include?(:confirmable)
      # don't send confirmation email!!!
      @resource.skip_confirmation!
    end

    sign_in(:user, @resource, store: false, bypass: false)

    @resource.save!

    yield @resource if block_given?

    render_data_or_redirect('deliverCredentials', @auth_params.as_json, @resource.as_json)
  end

  def assign_provider_attrs(user, auth_hash)
    user.assign_attributes({
                               nickname: auth_hash['info']['first_name'],
                               name: [auth_hash['info']['first_name'], auth_hash['info']['last_ame']].join(' '),
                               image: auth_hash['info']['image'],
                               email: auth_hash['info']['email']
                           })
  end


end