class Api::V1::RegistrationsController < DeviseTokenAuth::RegistrationsController
  include Api::V1::Docs::RegistrationsDoc

  def create
    super
  end

  def update
    super
  end
end
