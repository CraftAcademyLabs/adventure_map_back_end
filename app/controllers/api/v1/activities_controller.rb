class Api::V1::ActivitiesController < ActionController::API
  #include Api::V1::SetUserByToken
  include DeviseTokenAuth::Concerns::SetUserByToken

  include Api::V1::Docs::ActivitiesDoc

  before_action :set_default_response_format

  def index
    begin
      @activities = Activity.all
      render 'index'
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
    binding.pry
    @activity = Activity.new(resource_params.merge(user: current_api_v1_user))
    if @activity.save
      render 'show'
    else
      render 'errors', status: 422
    end

  end

  private

  def resource_params
    params.permit(:title, :body, :user_id, :difficulty, :category)
  end

  protected

  def set_default_response_format
    request.format = :json
  end
end
