class ChangeGoodsColumnForValidate < ActiveRecord::Migration[5.0]
  def change
    change_column :goods, :category_id, :integer
    add_index :goods, :category_id
    change_column :goods, :name, :string, :null => false
  end
end
