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

ActiveRecord::Schema.define(version: 2019_11_04_030945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dog_walking_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dog_walkings", force: :cascade do |t|
    t.integer "duration"
    t.string "latitude"
    t.string "longitude"
    t.datetime "begin_date"
    t.datetime "end_date"
    t.datetime "scheduled_date"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "dog_walking_status_id"
    t.index ["dog_walking_status_id"], name: "index_dog_walkings_on_dog_walking_status_id"
    t.index ["user_id"], name: "index_dog_walkings_on_user_id"
  end

  create_table "dog_walkings_dogs", id: false, force: :cascade do |t|
    t.bigint "dog_walking_id", null: false
    t.bigint "dog_id", null: false
    t.index ["dog_id", "dog_walking_id"], name: "index_dog_walkings_dogs_on_dog_id_and_dog_walking_id"
    t.index ["dog_walking_id", "dog_id"], name: "index_dog_walkings_dogs_on_dog_walking_id_and_dog_id"
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_dogs_on_user_id"
  end

  create_table "jwt_blacklists", force: :cascade do |t|
    t.string "jti"
    t.datetime "exp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_blacklists_on_jti"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id"
    t.string "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "dog_walkings", "dog_walking_statuses"
  add_foreign_key "dog_walkings", "users"
  add_foreign_key "dogs", "users"
  add_foreign_key "users", "roles"
end
