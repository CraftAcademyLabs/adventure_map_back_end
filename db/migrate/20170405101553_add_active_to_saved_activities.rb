class AddActiveToSavedActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :saved_activities, :active, :boolean, default: true
  end
end
