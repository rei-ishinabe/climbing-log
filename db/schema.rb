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

ActiveRecord::Schema.define(version: 2019_10_07_131841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "area_name"
    t.string "area_name_katakana"
    t.string "area_name_alphabet"
    t.string "region"
    t.string "prefecture"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "category"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grades", force: :cascade do |t|
    t.string "grade"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "grade_type"
  end

  create_table "gyms", force: :cascade do |t|
    t.string "name"
    t.string "name_katakana"
    t.string "name_alphabet"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "logs", force: :cascade do |t|
    t.date "date"
    t.string "comment"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "route_id"
    t.bigint "status_id"
    t.index ["route_id"], name: "index_logs_on_route_id"
    t.index ["status_id"], name: "index_logs_on_status_id"
  end

  create_table "od_logs", force: :cascade do |t|
    t.date "date"
    t.string "comment"
    t.bigint "status_id"
    t.bigint "od_route_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["od_route_id"], name: "index_od_logs_on_od_route_id"
    t.index ["status_id"], name: "index_od_logs_on_status_id"
    t.index ["user_id"], name: "index_od_logs_on_user_id"
  end

  create_table "od_route_reviews", force: :cascade do |t|
    t.string "comment"
    t.integer "rating"
    t.bigint "user_id"
    t.bigint "od_route_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "privacy_setting", default: 0
    t.string "image"
    t.index ["od_route_id"], name: "index_od_route_reviews_on_od_route_id"
    t.index ["user_id"], name: "index_od_route_reviews_on_user_id"
  end

  create_table "od_routes", force: :cascade do |t|
    t.string "route_name"
    t.string "route_name_katakana"
    t.string "route_name_alphabet"
    t.bigint "grade_id"
    t.bigint "sub_grade_id"
    t.bigint "sub_area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_od_routes_on_category_id"
    t.index ["grade_id"], name: "index_od_routes_on_grade_id"
    t.index ["sub_area_id"], name: "index_od_routes_on_sub_area_id"
    t.index ["sub_grade_id"], name: "index_od_routes_on_sub_grade_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "route_type"
    t.string "image"
    t.string "route_name"
    t.string "comment"
    t.bigint "category_id"
    t.bigint "grade_id"
    t.bigint "sub_grade_id"
    t.bigint "user_id"
    t.bigint "gym_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_routes_on_category_id"
    t.index ["grade_id"], name: "index_routes_on_grade_id"
    t.index ["gym_id"], name: "index_routes_on_gym_id"
    t.index ["sub_grade_id"], name: "index_routes_on_sub_grade_id"
    t.index ["user_id"], name: "index_routes_on_user_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "status"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_areas", force: :cascade do |t|
    t.string "sub_area_name"
    t.string "sub_area_name_katakana"
    t.string "sub_area_name_alphabet"
    t.bigint "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_sub_areas_on_area_id"
  end

  create_table "sub_grades", force: :cascade do |t|
    t.string "sub_grade"
    t.string "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "grade_type"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "nickname"
    t.string "image"
    t.boolean "is_public", default: false
    t.integer "privacy_setting", default: 0
    t.string "hash_string"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["hash_string"], name: "index_users_on_hash_string"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "logs", "routes"
  add_foreign_key "logs", "statuses"
  add_foreign_key "od_logs", "od_routes"
  add_foreign_key "od_logs", "statuses"
  add_foreign_key "od_logs", "users"
  add_foreign_key "od_route_reviews", "od_routes"
  add_foreign_key "od_route_reviews", "users"
  add_foreign_key "od_routes", "categories"
  add_foreign_key "od_routes", "grades"
  add_foreign_key "od_routes", "sub_areas"
  add_foreign_key "od_routes", "sub_grades"
  add_foreign_key "routes", "categories"
  add_foreign_key "routes", "grades"
  add_foreign_key "routes", "gyms"
  add_foreign_key "routes", "sub_grades"
  add_foreign_key "routes", "users"
  add_foreign_key "sub_areas", "areas"
end
