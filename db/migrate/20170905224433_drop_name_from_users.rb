class DropNameFromUsers < ActiveRecord::Migration[5.0]
  def change
    drop_table :admin_users
    remove_column :users, :name
  end
end
