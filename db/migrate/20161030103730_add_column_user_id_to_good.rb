class AddColumnUserIdToGood < ActiveRecord::Migration[5.0]
  def change
    add_column :goods, :user_id, :interger, :index => true
  end
end
