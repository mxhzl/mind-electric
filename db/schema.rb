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

ActiveRecord::Schema[8.0].define(version: 2025_09_26_210440) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "fields", force: :cascade do |t|
    t.string "prompt", null: false
    t.string "help_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "key", null: false
    t.index ["key"], name: "index_fields_on_key", unique: true
  end

  create_table "fields_forms", id: false, force: :cascade do |t|
    t.bigint "field_id", null: false
    t.bigint "form_id", null: false
    t.index ["field_id"], name: "index_fields_forms_on_field_id"
    t.index ["form_id"], name: "index_fields_forms_on_form_id"
  end

  create_table "forms", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "active", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "active"], name: "index_forms_on_name_and_active", unique: true
  end

  create_table "logs", force: :cascade do |t|
    t.date "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "form_id", null: false
    t.index ["form_id"], name: "index_logs_on_form_id"
    t.index ["user_id"], name: "index_logs_on_user_id"
  end

  create_table "responses", force: :cascade do |t|
    t.string "text", null: false
    t.bigint "field_id", null: false
    t.bigint "log_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_id"], name: "index_responses_on_field_id"
    t.index ["log_id"], name: "index_responses_on_log_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "logs", "forms"
  add_foreign_key "logs", "users"
  add_foreign_key "responses", "fields"
  add_foreign_key "responses", "logs"
end
