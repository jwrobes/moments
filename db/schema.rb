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

ActiveRecord::Schema.define(version: 20141001052552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "moments", force: true do |t|
    t.string   "message"
    t.date     "date"
    t.string   "phone_number"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "sent",           default: false
    t.string   "user_time_zone"
    t.datetime "time"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",                            null: false
    t.string   "encrypted_password",     default: "",                            null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                             null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "start_time"
    t.string   "end_time"
    t.string   "phone_number"
    t.string   "time_zone"
    t.integer  "utc_local_midnight"
    t.boolean  "moments_on",             default: false
    t.text     "message",                default: "It's time to take a moment."
    t.integer  "number_of_moments",      default: 5
    t.integer  "num_moments",            default: 5
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
