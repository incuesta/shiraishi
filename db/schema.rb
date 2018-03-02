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

ActiveRecord::Schema.define(version: 20180302154316) do

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

  create_table "client_docs", force: :cascade do |t|
    t.string "name"
    t.boolean "submitted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_profiles", force: :cascade do |t|
    t.string "image"
    t.string "sex"
    t.datetime "birth_date"
    t.string "address"
    t.string "city"
    t.string "zip_code"
    t.string "civil_status"
    t.string "mobile"
    t.string "telephone"
    t.string "company"
    t.string "department"
    t.string "employee_category"
    t.string "job_title"
    t.string "manager"
    t.boolean "enabled", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "client_id"
    t.index ["client_id"], name: "index_client_profiles_on_client_id"
  end

  create_table "clients", force: :cascade do |t|
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
    t.index ["confirmation_token"], name: "index_clients_on_confirmation_token", unique: true
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_clients_on_unlock_token", unique: true
    t.index ["user_name"], name: "index_clients_on_user_name", unique: true
  end

  create_table "golden_keys", force: :cascade do |t|
    t.bigint "client_id"
    t.boolean "enabled", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_golden_keys_on_client_id"
  end

  create_table "loan_docs", force: :cascade do |t|
    t.string "name"
    t.boolean "compulsory", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loan_installments", force: :cascade do |t|
    t.integer "installment_no"
    t.string "client"
    t.datetime "from"
    t.datetime "to"
    t.decimal "principal_amount", precision: 11, scale: 2
    t.decimal "interest_amount", precision: 11, scale: 2
    t.decimal "emi_installment", precision: 11, scale: 2
    t.string "state", default: "unpaid"
    t.text "notes"
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

  create_table "loan_type_loan_docs", force: :cascade do |t|
    t.bigint "loan_type_id"
    t.bigint "loan_doc_id"
    t.boolean "compulsory", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loan_doc_id"], name: "index_loan_type_loan_docs_on_loan_doc_id"
    t.index ["loan_type_id"], name: "index_loan_type_loan_docs_on_loan_type_id"
  end

  create_table "loan_types", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "interest_mode", default: "flat"
    t.decimal "rate", precision: 6, scale: 2
    t.string "repayment_method", default: "cheque/cash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "duration", default: 12
    t.decimal "minimum", precision: 11, scale: 2
    t.decimal "maximum", precision: 11, scale: 2
  end

  create_table "loans", force: :cascade do |t|
    t.string "string_id"
    t.datetime "application_date"
    t.datetime "approved_date"
    t.datetime "disbursement_date"
    t.string "status", default: "draft"
    t.decimal "principal_amount", precision: 11, scale: 2
    t.datetime "from"
    t.datetime "to"
    t.decimal "net_loan", precision: 11, scale: 2
    t.decimal "net_interest", precision: 11, scale: 2
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "client_id"
    t.bigint "loan_type_id"
    t.index ["client_id"], name: "index_loans_on_client_id"
    t.index ["loan_type_id"], name: "index_loans_on_loan_type_id"
    t.index ["string_id"], name: "index_loans_on_string_id", unique: true
  end

  add_foreign_key "accountant_profiles", "accountants"
  add_foreign_key "client_profiles", "clients"
  add_foreign_key "golden_keys", "clients"
  add_foreign_key "loan_manager_profiles", "loan_managers"
  add_foreign_key "loan_type_loan_docs", "loan_docs"
  add_foreign_key "loan_type_loan_docs", "loan_types"
  add_foreign_key "loans", "clients"
  add_foreign_key "loans", "loan_types"
end
