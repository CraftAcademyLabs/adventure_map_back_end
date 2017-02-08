class Api::V1::FollowsController < ActionController::API

  include DeviseTokenAuth::Concerns::SetUserByToken

  def create
    other_user = User.find(params[:user_id])
    if current_api_v1_user.follow other_user
      render 'success'
    else
      render 'error'
    end
  end
end
