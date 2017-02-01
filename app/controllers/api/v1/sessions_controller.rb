class Api::V1::SessionsController < DeviseTokenAuth::SessionsController
  include Api::V1::Docs::SessionsDoc

  def create
    super
  end

end
