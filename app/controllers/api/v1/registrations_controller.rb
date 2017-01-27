class Api::V1::RegistrationsController < DeviseTokenAuth::RegistrationsController
  include Api::V1::Docs::RegistrationsDoc
  before_action :configure_permitted_parameters
  before_action :authenticate_user, only: [:edit]
  before_action :whitelist_params, only: [:edit]

  def create
    super
  end

  def edit
    @user.update(whitelist_params)
    if @user.errors.empty?
      render json: {
          status: 'success',
          data: @user
      }
    else
      render_update_error
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit([:sign_up, :account_update, :edit], keys: [:name,
                                                                :nickname,
                                                                :image,
                                                                :date_of_birth,
                                                                :gender,
                                                                :city])
  end

  def authenticate_user
    @user = ::User.find_by(email: params['email'])
  end

  def whitelist_params
    params.permit(:user, :name,
                                :nickname,
                                :image,
                                :date_of_birth,
                                :gender,
                                :city)
  end
end
