class Api::V1::LikesController < ActionController::API
  include Api::V1::Docs::LikesDoc
  include DeviseTokenAuth::Concerns::SetUserByToken

  # Here "follow" means "like" - we are reusing gem functionality.

  def create
    activity = Activity.find(params[:activity_id])
    if current_api_v1_user.follow activity
      render 'success'
    else
      render 'error'
    end
  end

  def destroy
    activity = Activity.find(params[:id])
    if current_api_v1_user.stop_following activity
      render 'success'
    else
      render 'error'
    end
  end
end
