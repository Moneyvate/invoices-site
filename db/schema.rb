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

ActiveRecord::Schema.define(version: 20130911164634) do

  create_table "client_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_type_id"
  end

  add_index "clients", ["client_type_id"], name: "index_clients_on_client_type_id", using: :btree

  create_table "contact_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.integer  "contact_type_id"
    t.integer  "client_id"
    t.string   "name"
    t.string   "title"
    t.string   "email"
    t.integer  "phone",           limit: 8
    t.string   "skype"
    t.string   "im"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["client_id"], name: "index_contacts_on_client_id", using: :btree
  add_index "contacts", ["contact_type_id"], name: "index_contacts_on_contact_type_id", using: :btree

  create_table "tasks", force: true do |t|
    t.integer  "user_id"
    t.integer  "client_id"
    t.string   "name"
    t.text     "description"
    t.text     "notes"
    t.integer  "priority"
    t.date     "due_date"
    t.decimal  "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status"
    t.integer  "complexity"
  end

  add_index "tasks", ["client_id"], name: "index_tasks_on_client_id", using: :btree
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "work_logs", force: true do |t|
    t.integer  "task_id"
    t.date     "start_date"
    t.time     "start_time"
    t.date     "end_date"
    t.time     "end_time"
    t.decimal  "hours"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "work_logs", ["task_id"], name: "index_work_logs_on_task_id", using: :btree

end
