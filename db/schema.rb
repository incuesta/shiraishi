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

ActiveRecord::Schema.define(version: 20180228081333) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accountant_profiles", force: :cascade do |t|
    t.bigint "accountant_id"
    t.string "image"
    t.string "sex"
    t.datetime "birth_date"
    t.string "address"
    t.string "city"
    t.string "zip_code"
    t.string "civil_status"
    t.string "mobile"
    t.string "company"
    t.string "department"
    t.string "employee_category"
    t.string "job_title"
    t.string "manager"
    t.boolean "enabled", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accountant_id"], name: "index_accountant_profiles_on_accountant_id"
  end

  create_table "accountants", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name"
    t.string "timezone", default: "Singapore"
    t.boolean "enabled", default: false
    t.string "last_name"
    t.string "first_name"
    t.string "middle_name"
    t.index ["email"], name: "index_accountants_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accountants_on_reset_password_token", unique: true
    t.index ["user_name"], name: "index_accountants_on_user_name", unique: true
  end

  create_table "admin_profiles", force: :cascade do |t|
    t.bigint "admin_id"
    t.string "image"
    t.string "sex"
    t.datetime "birth_date"
    t.string "address"
    t.string "city"
    t.string "zip_code"
    t.string "civil_status"
    t.string "mobile"
    t.string "company"
    t.string "department"
    t.string "employee_category"
    t.string "job_title"
    t.string "manager"
    t.boolean "enabled", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_admin_profiles_on_admin_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name"
    t.string "timezone", default: "Singapore"
    t.boolean "enabled", default: true
    t.string "last_name"
    t.string "first_name"
    t.string "middle_name"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["user_name"], name: "index_admins_on_user_name", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loan_manager_profiles", force: :cascade do |t|
    t.bigint "loan_manager_id"
    t.string "image"
    t.string "sex"
    t.datetime "birth_date"
    t.string "address"
    t.string "city"
    t.string "zip_code"
    t.string "civil_status"
    t.string "mobile"
    t.string "company"
    t.string "department"
    t.string "employee_category"
    t.string "job_title"
    t.string "manager"
    t.boolean "enabled", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loan_manager_id"], name: "index_loan_manager_profiles_on_loan_manager_id"
  end

  create_table "loan_managers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name"
    t.string "timezone", default: "Singapore"
    t.boolean "enabled", default: false
    t.string "last_name"
    t.string "first_name"
    t.string "middle_name"
    t.index ["email"], name: "index_loan_managers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_loan_managers_on_reset_password_token", unique: true
  end

  add_foreign_key "accountant_profiles", "accountants"
  add_foreign_key "loan_manager_profiles", "loan_managers"
end
