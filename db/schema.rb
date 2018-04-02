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

ActiveRecord::Schema.define(version: 20180402113310) do

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

  create_table "accounting_books", force: :cascade do |t|
    t.bigint "loan_id"
    t.string "name"
    t.boolean "closed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "overall_principal_balance", precision: 11, scale: 2
    t.decimal "overall_interest_balance", precision: 11, scale: 2
    t.index ["loan_id"], name: "index_accounting_books_on_loan_id"
  end

  create_table "accounting_entries", force: :cascade do |t|
    t.string "title"
    t.datetime "entry_date"
    t.decimal "principal_balance"
    t.decimal "interest_income_balance"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "accounting_book_id"
    t.bigint "from_installment"
    t.index ["accounting_book_id"], name: "index_accounting_entries_on_accounting_book_id"
  end

  create_table "activity_logs", force: :cascade do |t|
    t.bigint "user_id"
    t.string "user_class"
    t.string "user_name"
    t.string "email"
    t.string "last_name"
    t.string "first_name"
    t.string "middle_name"
    t.integer "sign_in_count"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "browser"
    t.string "controller"
    t.string "action"
    t.string "params"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.boolean "is_system", default: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["user_name"], name: "index_admins_on_user_name", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.integer "position"
  end

  create_table "client_assets", force: :cascade do |t|
    t.bigint "client_id"
    t.string "image"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_client_assets_on_client_id"
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

  create_table "comments", force: :cascade do |t|
    t.bigint "commenter"
    t.string "commenter_class"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "conversation_id"
    t.index ["commenter"], name: "index_comments_on_commenter"
    t.index ["conversation_id"], name: "index_comments_on_conversation_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "subject", default: "Inquiry"
    t.boolean "is_close", default: false
    t.index ["client_id"], name: "index_conversations_on_client_id"
  end

  create_table "cr_entries", force: :cascade do |t|
    t.bigint "accounting_entry_id"
    t.string "description"
    t.decimal "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accounting_entry_id"], name: "index_cr_entries_on_accounting_entry_id"
  end

  create_table "dr_entries", force: :cascade do |t|
    t.bigint "accounting_entry_id"
    t.string "description"
    t.decimal "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accounting_entry_id"], name: "index_dr_entries_on_accounting_entry_id"
  end

  create_table "golden_keys", force: :cascade do |t|
    t.bigint "client_id"
    t.boolean "enabled", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_golden_keys_on_client_id"
  end

  create_table "guarantors", force: :cascade do |t|
    t.bigint "client_id"
    t.string "image"
    t.string "last_name"
    t.string "first_name"
    t.string "middle_name"
    t.string "sex"
    t.datetime "birth_date"
    t.string "address"
    t.string "city"
    t.string "zip_code"
    t.string "civil_status"
    t.string "mobile"
    t.string "company"
    t.string "job_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_guarantors_on_client_id"
  end

  create_table "loan_docs", force: :cascade do |t|
    t.string "name"
    t.boolean "compulsory", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loan_installment_containers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "fully_paid", default: false
    t.bigint "loan_id"
    t.index ["loan_id"], name: "index_loan_installment_containers_on_loan_id"
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
    t.bigint "loan_installment_container_id"
    t.index ["loan_installment_container_id"], name: "index_loan_installments_on_loan_installment_container_id"
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

  create_table "loan_searches", force: :cascade do |t|
    t.string "string_id"
    t.string "client_last_name"
    t.string "client_first_name"
    t.string "client_middle_name"
    t.bigint "loan_type_id"
    t.datetime "application_date"
    t.datetime "approved_date"
    t.datetime "disbursement_date"
    t.string "loan_status"
    t.boolean "fully_paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.boolean "fully_paid", default: false
    t.index ["client_id"], name: "index_loans_on_client_id"
    t.index ["loan_type_id"], name: "index_loans_on_loan_type_id"
    t.index ["string_id"], name: "index_loans_on_string_id", unique: true
  end

  create_table "sections", force: :cascade do |t|
    t.bigint "article_id"
    t.string "image"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.index ["article_id"], name: "index_sections_on_article_id"
  end

  create_table "submitted_docs", force: :cascade do |t|
    t.bigint "loan_id"
    t.string "name"
    t.boolean "submitted", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "loan_doc_id"
    t.index ["loan_doc_id"], name: "index_submitted_docs_on_loan_doc_id"
    t.index ["loan_id"], name: "index_submitted_docs_on_loan_id"
  end

  add_foreign_key "accountant_profiles", "accountants"
  add_foreign_key "accounting_books", "loans"
  add_foreign_key "accounting_entries", "accounting_books"
  add_foreign_key "client_assets", "clients"
  add_foreign_key "client_profiles", "clients"
  add_foreign_key "conversations", "clients"
  add_foreign_key "cr_entries", "accounting_entries"
  add_foreign_key "dr_entries", "accounting_entries"
  add_foreign_key "golden_keys", "clients"
  add_foreign_key "guarantors", "clients"
  add_foreign_key "loan_installment_containers", "loans"
  add_foreign_key "loan_installments", "loan_installment_containers"
  add_foreign_key "loan_manager_profiles", "loan_managers"
  add_foreign_key "loan_type_loan_docs", "loan_docs"
  add_foreign_key "loan_type_loan_docs", "loan_types"
  add_foreign_key "loans", "clients"
  add_foreign_key "loans", "loan_types"
  add_foreign_key "sections", "articles"
  add_foreign_key "submitted_docs", "loan_docs"
  add_foreign_key "submitted_docs", "loans"
end
