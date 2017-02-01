class Api::V1::ActivitiesController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Api::V1::Docs::ActivitiesDoc


  def create
    @activity = Activity.new(resource_params.merge(user: current_api_v1_user))
    if @activity.save
      render 'show'
    else
      render 'errors'
    end

  end

  private

  def resource_params
    params.permit(:title, :body, :user_id, :difficulty, :category)
  end
end