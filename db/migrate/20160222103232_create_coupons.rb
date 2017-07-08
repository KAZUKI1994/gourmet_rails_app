class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :concept
      t.text :course
      t.integer :price
      t.integer :restaurant_id

      t.timestamps null: false
    end
  end
end
