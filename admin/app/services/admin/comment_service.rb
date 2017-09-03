class Admin::CommentService
  include Godmin::Resources::ResourceService

  attrs_for_index :body, :user, :activity
  attrs_for_show :body, :user, :activity
  attrs_for_form :body, :user, :activity
end
