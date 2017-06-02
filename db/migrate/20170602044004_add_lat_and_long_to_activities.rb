class AddLatAndLongToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :lat, :float
    add_column :activities, :lng, :float
  end
end
