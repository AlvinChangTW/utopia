class AddColumnSecretToComment < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :secret, :bolean
  end
end
