class Api::V1::SavedActivitiesController < ActionController::API
  include Api::V1::Docs::LikesDoc
  include DeviseTokenAuth::Concerns::SetUserByToken

  def index

  end

  def create
    activity = Activity.find(params[:activity_id])
    if SavedActivity.create(user: current_api_v1_user, activity: activity)
      render 'api/v1/blank/success'
    else
      render 'api/v1/blank/errorerror'
    end
  end

  # def destroy
  #   activity = Activity.find(params[:id])
  #   if current_api_v1_user.stop_following activity
  #     render 'success'
  #   else
  #     render 'error'
  #   end
  # end
end
