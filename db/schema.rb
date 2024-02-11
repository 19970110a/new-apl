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

ActiveRecord::Schema[7.0].define(version: 2024_02_11_144833) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "drinks", force: :cascade do |t|
    t.string "name", null: false
    t.integer "degree", null: false
    t.integer "volume", null: false
    t.bigint "category_id", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "predefined", default: false
    t.index ["category_id"], name: "index_drinks_on_category_id"
    t.index ["user_id"], name: "index_drinks_on_user_id"
  end

  create_table "random_speeches", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.string "alcohol_speeches"
    t.string "random_speeches"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_random_speeches_on_character_id"
  end

  create_table "records", force: :cascade do |t|
    t.date "date", null: false
    t.integer "quantity", null: false
    t.integer "alcohol_grams", null: false
    t.bigint "drink_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drink_id"], name: "index_records_on_drink_id"
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "crypted_password", null: false
    t.integer "weight"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "character_id"
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.boolean "admin"
    t.index ["character_id"], name: "index_users_on_character_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "character_bodies", "characters"
  add_foreign_key "drinks", "categories"
  add_foreign_key "drinks", "users"
  add_foreign_key "random_speeches", "characters"
  add_foreign_key "records", "drinks"
  add_foreign_key "records", "users"
  add_foreign_key "users", "characters"
end
