class Admin::ActivityService
  include Godmin::Resources::ResourceService

  attrs_for_index :title, :category, :difficulty, :user
  attrs_for_show :title, :body, :difficulty, :category, :user,
    :activity_details, :comments
  attrs_for_form :title, :body, :difficulty, :category, :user

  filter :user, as: :select, collection: -> { User.all }, option_text: 'name'

  filter :title

  def filter_user(resources, value)
    User.where('name LIKE ?', "%#{value}%")
  end

  def filter_title(resources, value)
    resources.where('title LIKE ?', "%#{value}%")
  end
end
