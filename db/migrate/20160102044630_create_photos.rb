class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :file_name
      t.integer :restaurant_id
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
