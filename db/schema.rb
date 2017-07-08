# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160323182643) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "url"
  end

  create_table "banners", force: :cascade do |t|
    t.string   "link"
    t.datetime "start_time"
    t.datetime "finish_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.string   "concept"
    t.text     "course"
    t.integer  "price"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "hashtags", force: :cascade do |t|
    t.string   "firstdate"
    t.string   "onesidelove"
    t.string   "confession"
    t.string   "lunch"
    t.string   "cafe"
    t.string   "dinner"
    t.string   "aniversary"
    t.string   "xmas"
    t.string   "valentine"
    t.string   "whiteday"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "post_id"
    t.string   "birthday"
    t.string   "surprise"
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "post_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "images"
    t.integer  "banner_id"
    t.integer  "coupon_id"
    t.integer  "article_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.text     "content"
    t.string   "time_zone"
    t.integer  "amount"
    t.integer  "total_eval"
    t.integer  "quality_eval"
    t.integer  "service_eval"
    t.integer  "atomos_eval"
    t.integer  "drink_eval"
    t.integer  "partner_eval"
    t.datetime "visit_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author_name"
    t.string   "author_college"
    t.string   "author_faculty"
    t.string   "author_grade"
    t.string   "author_gender"
    t.string   "relation"
    t.string   "titile"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "url"
    t.string   "telnumber"
    t.string   "area"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",          null: false
    t.string   "encrypted_password",     default: "",          null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,           null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "username",               default: "anonymous"
    t.string   "nickname"
    t.string   "college"
    t.string   "faculty"
    t.string   "grade"
    t.string   "gender"
    t.integer  "admin"
    t.string   "image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
