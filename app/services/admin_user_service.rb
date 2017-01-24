class AdminUserService
  include Godmin::Resources::ResourceService

  attrs_for_index :name, :email, :created_at
  attrs_for_show :name, :email, :created_at, :updated_at
  attrs_for_form :first_name, :last_name, :email, :password, :password_confirmation
end
