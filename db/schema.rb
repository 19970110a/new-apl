# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_01_15_105846) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "character_bodies", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.binary "character_image"
    t.integer "character_kg"
    t.string "character_body_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_bodies_on_character_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "animal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "master_drinks", force: :cascade do |t|
    t.string "select_drink"
    t.binary "drink_image"
    t.integer "alcohol_percentage"
    t.integer "alcohol_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "master_user_drinks", force: :cascade do |t|
    t.bigint "user_drink_id", null: false
    t.bigint "master_drink_id", null: false
    t.integer "alcohol_percentage"
    t.integer "alcohol_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["master_drink_id"], name: "index_master_user_drinks_on_master_drink_id"
    t.index ["user_drink_id"], name: "index_master_user_drinks_on_user_drink_id"
  end

  create_table "random_speeches", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.string "alcohol_speeches"
    t.string "random_speeches"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_random_speeches_on_character_id"
  end

  create_table "user_and_drinks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "master_user_drink_id", null: false
    t.date "drink_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["master_user_drink_id"], name: "index_user_and_drinks_on_master_user_drink_id"
    t.index ["user_id"], name: "index_user_and_drinks_on_user_id"
  end

  create_table "user_characters", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "character_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_user_characters_on_character_id"
    t.index ["user_id"], name: "index_user_characters_on_user_id"
  end

  create_table "user_drinks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "master_drink_id", null: false
    t.date "drink_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["master_drink_id"], name: "index_user_drinks_on_master_drink_id"
    t.index ["user_id"], name: "index_user_drinks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "crypted_password", null: false
    t.integer "weight"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "character_bodies", "characters"
  add_foreign_key "master_user_drinks", "master_drinks"
  add_foreign_key "master_user_drinks", "user_drinks"
  add_foreign_key "random_speeches", "characters"
  add_foreign_key "user_and_drinks", "master_user_drinks"
  add_foreign_key "user_and_drinks", "users"
  add_foreign_key "user_characters", "characters"
  add_foreign_key "user_characters", "users"
  add_foreign_key "user_drinks", "master_drinks"
  add_foreign_key "user_drinks", "users"
end
