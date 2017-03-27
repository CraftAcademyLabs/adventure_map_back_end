class Api::V1::SessionsController < DeviseTokenAuth::SessionsController
  include Api::V1::Docs::SessionsDoc

  def create
    super
  end

  def destroy
    super
  end

  def render_create_success
    render 'success'
  end

end
