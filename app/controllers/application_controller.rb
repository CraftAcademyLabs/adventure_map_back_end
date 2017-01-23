class ApplicationController < ActionController::Base
  include Godmin::ApplicationController
  include Godmin::Authentication

  def admin_user_class
    AdminUser
  end
  protect_from_forgery with: :exception
end
