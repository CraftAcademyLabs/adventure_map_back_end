class Api::V1::CommentsController < ActionController::API

  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :set_default_response_format
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_api_v1_user.id if current_api_v1_user
    if @comment.save
      render 'success'
    else
      render 'error'
    end
  end

  private

  def comment_params
    params.permit(:body, :activity_id)
  end


  protected

  def set_default_response_format
    request.format = :json
  end
end
