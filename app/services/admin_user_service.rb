class AdminUserService
  include Godmin::Resources::ResourceService

  attrs_for_index :email, :created_at, :updated_at
  attrs_for_show :email, :created_at, :updated_at
  attrs_for_form :email, :password, :password_confirmation
end
