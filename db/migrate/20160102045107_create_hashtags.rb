class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.integer :post_id
      t.boolean :couple
      t.boolean :firstdate
      t.boolean :onesidelove
      t.boolean :confession
      t.boolean :lunch
      t.boolean :cafe
      t.boolean :dinner
      t.boolean :aniversary
      t.boolean :oneyear_ani
      t.boolean :onemonth_ani
      t.boolean :xmas
      t.boolean :valentine
      t.boolean :whiteday

      t.timestamps null: false
    end
  end
end
