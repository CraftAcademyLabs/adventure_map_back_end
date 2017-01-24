class UsersController < ApplicationController
  include Godmin::Resources::ResourceController


  def destroy
    @resource_service.destroy_resource(@resource)

    respond_to do |format|
      format.html { redirect_to redirect_after_destroy, notice: redirect_flash_message }
      format.json { head :no_content }
    end
  end

  private

  def redirect_after_save
    users_path
  end
end
