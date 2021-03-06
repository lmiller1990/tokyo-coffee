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

ActiveRecord::Schema.define(version: 20170811123516) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "districts", force: :cascade do |t|
    t.string "japanese_name"
    t.string "english_name"
    t.bigint "ward_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ward_id"], name: "index_districts_on_ward_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facilities_shops", id: false, force: :cascade do |t|
    t.bigint "shop_id", null: false
    t.bigint "facility_id", null: false
    t.index ["facility_id"], name: "index_facilities_shops_on_facility_id"
    t.index ["shop_id"], name: "index_facilities_shops_on_shop_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "link"
    t.bigint "user_id"
    t.bigint "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_photos_on_shop_id"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment", null: false
    t.bigint "user_id"
    t.bigint "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_reviews_on_shop_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "shops", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "district_id"
    t.string "japanese_name"
    t.string "english_name"
    t.boolean "registration_approved", default: false, null: false
    t.string "description"
    t.string "additional_details"
    t.string "station"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wards", force: :cascade do |t|
    t.string "japanese_name"
    t.string "english_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "districts", "wards"
  add_foreign_key "photos", "shops"
  add_foreign_key "photos", "users"
  add_foreign_key "reviews", "shops"
  add_foreign_key "reviews", "users"
end
