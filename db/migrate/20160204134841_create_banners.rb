class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :image
      t.string :link
      t.datetime :start_time
      t.datetime :finish_time

      t.timestamps null: false
    end
  end
end
