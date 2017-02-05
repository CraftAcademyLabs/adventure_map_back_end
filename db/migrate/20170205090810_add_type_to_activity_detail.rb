class AddTypeToActivityDetail < ActiveRecord::Migration[5.0]
  def change
    add_column :activity_details, :attachment_type, :string
  end
end
