class ActivityDetailService
  include Godmin::Resources::ResourceService

  attrs_for_index :file_attachment, :activity
  attrs_for_show :file_attachment, :activity
  attrs_for_form :file_attachment, :activity
  filter :file_attachment

  def filter_file_attachment(resources, value)
    resources.where('file_attachment LIKE ?', "%#{value}%")
  end

end
