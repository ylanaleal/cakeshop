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

ActiveRecord::Schema[7.1].define(version: 2024_06_10_003508) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_products", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lead_events", force: :cascade do |t|
    t.string "event_type"
    t.date "event_date"
    t.integer "guest_number"
    t.string "theme"
    t.bigint "event_product_id", null: false
    t.integer "product_quantity"
    t.bigint "user_id", null: false
    t.string "full_name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_product_id"], name: "index_lead_events_on_event_product_id"
    t.index ["user_id"], name: "index_lead_events_on_user_id"
  end

  create_table "user_addresses", force: :cascade do |t|
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "city"
    t.string "postal_code"
    t.string "user_references"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_payments", force: :cascade do |t|
    t.string "payment_type"
    t.string "provider"
    t.integer "account_no"
    t.string "user_references"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "lead_events", "event_products"
  add_foreign_key "lead_events", "users"
end
