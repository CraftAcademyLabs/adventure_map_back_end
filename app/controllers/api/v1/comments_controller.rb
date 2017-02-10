class Api::V1::CommentsController < ActionController::API

  include DeviseTokenAuth::Concerns::SetUserByToken
  include Api::V1::Docs::CommentsDoc

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

  def destroy
    @comment = Comment.find(params[:id])

    if correct_user && @comment.destroy
      render  json: {status: 'success'}, status: 200
    else
      render  json: {status: 'error'}, status: 409
    end
  end

  private

  def correct_user
    current_api_v1_user.id == @comment.user_id
  end

  def comment_params
    params.permit(:body, :activity_id)
  end


  protected

  def set_default_response_format
    request.format = :json
  end
end
