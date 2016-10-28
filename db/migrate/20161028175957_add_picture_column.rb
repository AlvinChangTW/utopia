class AddPictureColumn < ActiveRecord::Migration[5.0]
   def change
      add_attachment :goods, :picture
  end
end
