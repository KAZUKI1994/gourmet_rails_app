class Createpost < ActiveRecord::Migration
  def change
    create_table "posts", force: :cascade do |t|
      t.integer "user_id"
      t.integer "restaurant_id"
      t.text "content"
      t.string "time_zone"
      t.integer "amount"
      t.integer "total_eval"
      t.integer "quality_eval"
      t.integer "service_eval"
      t.integer "atomos_eval"
      t.integer "drink_eval"
      t.integer "partner_eval"
      t.datetime "visit_date"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string "author_name"
      t.string "author_college"
      t.string "author_faculty"
      t.string "author_grade"
      t.string "author_gender"
      t.string "relation"
    end
  end
end
