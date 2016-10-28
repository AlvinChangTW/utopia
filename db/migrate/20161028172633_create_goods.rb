class CreateGoods < ActiveRecord::Migration[5.0]
  def change
    create_table :goods do |t|
      t.string :name
      t.string :area
      t.string :type
      t.integer :category_id
      t.string :status
      t.text :description

      t.timestamps
    end
  end
end
