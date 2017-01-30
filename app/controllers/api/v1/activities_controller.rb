class Api::V1::ActivitiesController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  # before_action authenticate_api_v1_user!, only: [:create]

  def create
    authenticate_api_v1_user!
    activity = Activity.new(resource_params.merge(user_id: current_api_v1_user.id))
    if activity.save
      render json: {
          status: 'success',
          activity: {
              title: activity.title,
              body: activity.body,
              difficulty: activity.difficulty,
              category: activity.category,
              user_id: activity.user.id
          }
      }
    else
      render json: {
          data: 'error',
          message: activity.errors
      }
    end

  end

  private

  def resource_params
    params.require(:activity).permit(:title, :body, :user_id, :difficulty, :category)
  end
end