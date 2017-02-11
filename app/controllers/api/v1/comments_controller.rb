class Api::V1::CommentsController < ActionController::API

  include DeviseTokenAuth::Concerns::SetUserByToken
  include Api::V1::Docs::CommentsDoc

  before_action :set_default_response_format
  before_action :correct_user, only: [:update, :destroy]

  def update
    if @comment.update_attributes(comment_params)
      render 'success'
    else
      render 'error'
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_api_v1_user.id if current_api_v1_user
    if @comment.save
      render 'success'
    else
      render 'error'
    end
  end

  def destroy
    if @comment.destroy
      render  json: {status: 'success'}, status: 200
    else
      render  json: {status: 'error'}, status: 409
    end
  end

  private

  def correct_user
    @comment = Comment.find(params[:id])
    return true if current_api_v1_user.id == @comment.user_id
    render json: {
      status: 'error',
      message: 'You are not allowed to perform this action'
    }, status: 409
  end

  def comment_params
    params.permit(:body, :activity_id)
  end


  protected

  def set_default_response_format
    request.format = :json
  end
end
