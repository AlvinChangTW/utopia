class AddColumnUserIdToGood < ActiveRecord::Migration[5.0]
  def change
    add_column :goods, :user_id, :interger
    add_index :goods, :user_id
  end
end
