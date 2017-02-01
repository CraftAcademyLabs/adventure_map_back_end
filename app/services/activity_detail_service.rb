class ActivityDetailService
  include Godmin::Resources::ResourceService

  attrs_for_index :file_attachment#, :activity:references
  attrs_for_show :file_attachment#, :activity:references
  attrs_for_form :file_attachment#, :activity:references
end
