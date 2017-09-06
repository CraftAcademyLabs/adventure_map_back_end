class Api::V1::OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController


  def assign_provider_attrs(user, auth_hash)
    oauth_attrs = {
        first_name: auth_hash['info']['first_name'],
        last_name: auth_hash['info']['last_name'],
        email: auth_hash['info']['email']
    }

    unless user.image
      oauth_attrs.merge!({image: auth_hash['info']['image']})
    end

    unless user.nickname
      oauth_attrs.merge!({nickname: auth_hash['info']['first_name'].downcase})
    end

    user.assign_attributes(oauth_attrs)
  end


  def render_data(message, data)
    user = resource_class.find_by(email: data['email'])
    @data = data.merge({
                           message: message,
                           interest_list: user.interest_list,
                           counts: {
                               followings: user.follow_count,
                               followers: user.followers_count,
                               my_activities: user.activities.count,
                               my_saved_activities: user.my_saved_activities.count
                           }
                       })
    render layout: nil, template: 'devise_token_auth/omniauth_external_window'
  end

end