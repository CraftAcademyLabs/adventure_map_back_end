class Api::V1::RegistrationsController < DeviseTokenAuth::RegistrationsController
  include Api::V1::Docs::RegistrationsDoc

  def create
    super
    @resource = nil
    puts @resource.inspect
  end

  def update
    super
  end

  protected

  def render_create_success
    render 'api/v1/create_success'
  end

  def render_create_error
    render 'api/v1/create_error', status: 422
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,
                                                       :nickname,
                                                       :image,
                                                       :date_of_birth,
                                                       :gender,
                                                       :city,
                                                       :interest_list])
  end

  def account_update_params
    params.permit(:name, :nickname, :image, :date_of_birth,
                               :gender, :city, :interest_list)
  end
end
