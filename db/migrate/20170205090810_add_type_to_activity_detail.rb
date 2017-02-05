class AddTypeToActivityDetail < ActiveRecord::Migration[5.0]
  def change
    add_column :activity_details, :type, :string
  end
end
