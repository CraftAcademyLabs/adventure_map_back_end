class Api::V1::ActivitiesController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Api::V1::Docs::ActivitiesDoc

  before_action :set_default_response_format

  def index
    begin
      if params[:user_id]
        @activities = Activity.where(user: current_api_v1_user)
      else
        @activities = Activity.all
      end
    rescue => e
      render json: { errors: e }, status: 422
    end

  end

  def show
    @activity = Activity.find(params[:id])
    @user = @activity.user
    @activity_details = @activity.activity_details
  end

  def create
    @activity = Activity.new(resource_params.merge(user: current_api_v1_user))
    if @activity.save
      render 'show'
    else
      render 'errors', status: 422
    end

  end

  private

  def resource_params
    params.permit(:title, :body, :user_id, :difficulty, :category, :lat, :lng)
  end

  protected

  def set_default_response_format
    request.format = :json
  end
end
