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

ActiveRecord::Schema.define(version: 2019_07_28_002909) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string "status"
    t.string "comment"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "route_id"
    t.index ["route_id"], name: "index_logs_on_route_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "logs", "routes"
  add_foreign_key "routes", "categories"
  add_foreign_key "routes", "grades"
  add_foreign_key "routes", "gyms"
  add_foreign_key "routes", "sub_grades"
  add_foreign_key "routes", "users"
end
