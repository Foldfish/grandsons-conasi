# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160423065647) do

  create_table "attendance_records", force: :cascade do |t|
    t.date     "start_of_week"
    t.integer  "monday_store_id"
    t.integer  "tuesday_store_id"
    t.integer  "wednesday_store_id"
    t.integer  "thursday_store_id"
    t.integer  "friday_store_id"
    t.integer  "saturday_store_id"
    t.integer  "sunday_store_id"
    t.integer  "demo_staff_member_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "attendance_records", ["demo_staff_member_id"], name: "index_attendance_records_on_demo_staff_member_id"
  add_index "attendance_records", ["friday_store_id"], name: "index_attendance_records_on_friday_store_id"
  add_index "attendance_records", ["monday_store_id"], name: "index_attendance_records_on_monday_store_id"
  add_index "attendance_records", ["saturday_store_id"], name: "index_attendance_records_on_saturday_store_id"
  add_index "attendance_records", ["sunday_store_id"], name: "index_attendance_records_on_sunday_store_id"
  add_index "attendance_records", ["thursday_store_id"], name: "index_attendance_records_on_thursday_store_id"
  add_index "attendance_records", ["tuesday_store_id"], name: "index_attendance_records_on_tuesday_store_id"
  add_index "attendance_records", ["wednesday_store_id"], name: "index_attendance_records_on_wednesday_store_id"

  create_table "chains", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "contact"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers_stores", id: false, force: :cascade do |t|
    t.integer "customer_id"
    t.integer "store_id"
  end

  add_index "customers_stores", ["customer_id"], name: "index_customers_stores_on_customer_id"
  add_index "customers_stores", ["store_id"], name: "index_customers_stores_on_store_id"

  create_table "demo_staff_members", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "RFC"
    t.string   "CURP"
    t.string   "NSS"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "models", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "models", ["email"], name: "index_models_on_email", unique: true
  add_index "models", ["reset_password_token"], name: "index_models_on_reset_password_token", unique: true

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "stores", force: :cascade do |t|
    t.string   "store_key"
    t.string   "name"
    t.string   "address"
    t.integer  "chain_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "stores", ["chain_id"], name: "index_stores_on_chain_id"

  create_table "supervisors", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "RFC"
    t.integer  "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "supervisors", ["store_id"], name: "index_supervisors_on_store_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
