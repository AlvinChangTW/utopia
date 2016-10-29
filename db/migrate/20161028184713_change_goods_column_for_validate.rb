class ChangeGoodsColumnForValidate < ActiveRecord::Migration[5.0]
  def change
    change_column :goods, :category_id, :integer, :index => true
    change_column :goods, :name, :string, :null => false
  end
end
