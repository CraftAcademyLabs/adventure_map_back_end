class CreateActivityDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :activity_details do |t|
      t.references :activity, foreign_key: true
      t.string :file_attachment

      t.timestamps
    end
  end
end
