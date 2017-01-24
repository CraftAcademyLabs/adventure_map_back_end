class ActivityService
  include Godmin::Resources::ResourceService

  attrs_for_index :title, :category, :difficulty
  attrs_for_show :title, :body, :difficulty, :category
  attrs_for_form :title, :body, :difficulty, :category
end
