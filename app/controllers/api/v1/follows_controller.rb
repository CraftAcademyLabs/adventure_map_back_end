class Api::V1::FollowsController < ActionController::API
  include Api::V1::Docs::FollowsDoc
  include DeviseTokenAuth::Concerns::SetUserByToken

  def index
    if params['request'] == 'followings'
      render 'followings'
    else
      render 'followers'
    end

  end

  def create
    other_user = User.find(params[:user_id])
    if current_api_v1_user.follow other_user
      render 'success'
    else
      render 'error'
    end
  end

  def destroy
    other_user = User.find(params[:id])
    if current_api_v1_user.stop_following other_user
      render 'success'
    else
      render 'error'
    end
  end
end
