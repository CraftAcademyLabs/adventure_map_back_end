class Api::V1::SavedActivitiesController < ActionController::API
  include Api::V1::Docs::SavedActivitiesDoc
  include DeviseTokenAuth::Concerns::SetUserByToken

  def index
    @activities = current_api_v1_user.my_saved_activities
  end

  def create
    activity = Activity.find(params[:activity_id])
    if saving = SavedActivity.find_by(user: current_api_v1_user, activity: activity)
      saving.active = true
      if saving.save
        render 'api/v1/blank/success'
      else
        render 'api/v1/blank/error'
      end
    elsif SavedActivity.create(user: current_api_v1_user, activity: activity)
      render 'api/v1/blank/success'
    else
      render 'api/v1/blank/error'
    end
  end

  def destroy
    activity = Activity.find(params[:id])
    saved_activity = SavedActivity.find_by(activity_id: activity.id)
    saved_activity.active = false
    if saved_activity.save
      render 'api/v1/blank/success'
    else
      render 'api/v1/blank/error'
    end
  end
end
