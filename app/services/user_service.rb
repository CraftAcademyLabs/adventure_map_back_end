class UserService
  include Godmin::Resources::ResourceService

  attrs_for_index :email
  attrs_for_show :email
  attrs_for_form :email, :password, :password_confirmation
end
