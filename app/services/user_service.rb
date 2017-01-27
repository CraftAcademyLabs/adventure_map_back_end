class UserService
  include Godmin::Resources::ResourceService

  attrs_for_index :name, :nickname, :email, :created_at
  attrs_for_form :name, :nickname, :email, :date_of_birth, :gender, :city, :interest_list, :password, :password_confirmation
  attrs_for_show :image, :name, :nickname, :email, :interest_list, :date_of_birth, :gender, :city, :created_at, :updated_at

  def resource_class
    ::User
  end

  def build_resource(_params)
    user = super
    #user.setup_more_things
    user
  end

  def create_resource(resource)
    resource.save
  end

  def resource_class
    ::User
  end

  def update_resource(resource, params)
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
    resource.update(params)
  end

end
