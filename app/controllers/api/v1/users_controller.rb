class Api::V1::UsersController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Api::V1::Docs::UsersDoc

  def activities
    @activities = Activity.where(user: current_api_v1_user)
  end

end