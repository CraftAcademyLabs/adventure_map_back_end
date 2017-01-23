class ChangeTokensToText < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.change :tokens, :text
    end
  end
end
