class RenameSaveTable < ActiveRecord::Migration[5.0]
  def change
    rename_table(:saves, :saved_activities)
  end
end
