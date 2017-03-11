class Api::V1::ActivitiesController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Api::V1::Docs::ActivitiesDoc

  before_action :set_default_response_format

  def index
    @activities = Activity.all
    render 'index'
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
      render 'errors'
    end

  end

  private

  def resource_params
    params.permit(:title, :body, :user_id, :difficulty, :category)
  end

  protected

  def set_default_response_format
    request.format = :json
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end
end
