class Admin::ActivityDetailService
  include Godmin::Resources::ResourceService

  attrs_for_index :activity, :file_attachment, :attachment_type
  attrs_for_show :activity , :file_attachment, :attachment_type
  attrs_for_form :file_attachment, :attachment_type, :activity

  filter :file_attachment

  def filter_file_attachment(resources, value)
    resources.where('file_attachment LIKE ?', "%#{value}%")
  end

end
