class Admin::UsersController < Admin::ApplicationController
  include Godmin::Resources::ResourceController


  private

  def resource_service
    service = super
    service.options[:interest_list] = params[:interest_list]
    service
  end

  def resource_params
    params.require(:user).permit(:name,
                                 :nickname,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 :gender,
                                 :date_of_birth,
                                 :interest_list,
                                 :description,
                                 :city,
                                 :image)
  end
end
