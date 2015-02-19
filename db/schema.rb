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

ActiveRecord::Schema.define(version: 20150219091534) do

  create_table "stocks", force: true do |t|
    t.string   "name"
    t.string   "symbol"
    t.text     "description"
    t.string   "exchange"
    t.string   "graph_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", force: true do |t|
    t.string   "transaction_type"
    t.integer  "quantity"
    t.decimal  "rate"
    t.string   "currency"
    t.decimal  "gross_proceeds"
    t.decimal  "tax"
    t.decimal  "commission"
    t.decimal  "net_proceeds"
    t.date     "registration_date"
    t.date     "charge_date"
    t.date     "value_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "stock_id"
    t.integer  "gross_proceeds_cents", default: 0, null: false
    t.integer  "commission_cents",     default: 0, null: false
    t.integer  "net_proceeds_cents",   default: 0, null: false
    t.integer  "tax_cents",            default: 0, null: false
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
