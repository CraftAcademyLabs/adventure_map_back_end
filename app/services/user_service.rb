class UserService
  include Godmin::Resources::ResourceService

  attrs_for_index :name, :nickname, :email, :created_at
  attrs_for_show :name, :nickname, :email, :created_at, :updated_at
  attrs_for_form :name, :nickname, :email, :password, :password_confirmation

  def update_resource(resource, params)
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
    resource.update(params)
  end

end
