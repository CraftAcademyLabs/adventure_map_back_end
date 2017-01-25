class AddAttributesToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :date_of_birth, :string
    add_column :users, :sex, :string
    add_column :users, :city, :string
  end
end
