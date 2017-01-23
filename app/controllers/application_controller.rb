class ApplicationController < ActionController::Base
  include Godmin::ApplicationController
  include Godmin::Authentication
  protect_from_forgery with: :exception

  def admin_user_class
    AdminUser
  end
end
