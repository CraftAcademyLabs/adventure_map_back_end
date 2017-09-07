# frozen_string_literal: true
class Admin::UserService
  include Godmin::Resources::ResourceService

  attrs_for_index :nickname, :email, :created_at, :administrator
  attrs_for_form :image, :nickname, :email, :date_of_birth, :gender, :city,
                 :interest_list, :password, :password_confirmation, :administrator
  attrs_for_show :image, :nickname, :email, :description, :interest_list,
                 :date_of_birth, :gender, :city, :created_at, :updated_at, :administrator

  def update_resource(resource, params)
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
    resource.update(params)
  end
end
