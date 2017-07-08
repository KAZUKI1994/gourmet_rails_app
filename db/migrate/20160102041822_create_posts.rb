class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :titile
      t.integer :user_id
      t.integer :restaurant_id
      t.text :content
      t.string :time_zone
      t.integer :amount
      t.integer :total_eval
      t.integer :quality_eval
      t.integer :service_eval
      t.integer :atomos_eval
      t.integer :drink_eval
      t.integer :partner_eval
      t.datetime :visit_date
      t.string :url

      t.timestamps null: false
    end
  end
end
