class Api::V1::RegistrationsController < DeviseTokenAuth::RegistrationsController
  include Api::V1::Docs::RegistrationsDoc
  before_action :configure_permitted_parameters
  before_action :authenticate_user, only: [:edit]
  before_action :whitelist_params, only: [:edit]

  def create
    super
  end

  def edit
    binding.pry
    @user.update(whitelist_params) unless @user.nil?
    if @user.errors.empty?
      render json: {
          status: 'success',
          data: @user
      }
    else
      @resource = @user
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
    binding.pry
    # I don't have access to @user.password - there has to be some smart API access token thing that could happen here so that users can be validated through the API. I can't find it.
    if @user && @user.password == params['password']
      @user
    else
      render json: {
          status: 'error',
          data: 'Invalid credentials'
      }
    end
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
