class Api::V1::RegistrationsController < DeviseTokenAuth::RegistrationsController
  include Api::V1::Docs::RegistrationsDoc
  before_action :configure_permitted_parameters

  def create
    super
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,
                                                       :nickname,
                                                       :image,
                                                       :date_of_birth,
                                                       :gender,
                                                       :city,
                                                       :interest_list])
  end
end
