class Api::V1::UsersController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken


  def show
    @user = User.find(params[:id])
  rescue => e
    render json: {error: e}, status: 422
  end
end