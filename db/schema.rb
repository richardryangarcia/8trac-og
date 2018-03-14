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

ActiveRecord::Schema.define(version: 20180313214555) do

  create_table "instruments", force: :cascade do |t|
    t.string  "name",                 limit: 250
    t.string  "symbol",               limit: 50
    t.string  "state",                limit: 50
    t.string  "tradeable",            limit: 50
    t.string  "robinhood_id",         limit: 250
    t.decimal "open_price",                         precision: 13, scale: 10
    t.decimal "high",                               precision: 13, scale: 10
    t.decimal "low",                                precision: 13, scale: 10
    t.decimal "volume",                             precision: 15, scale: 15
    t.decimal "average_volume",                     precision: 15, scale: 15
    t.decimal "high_fifty_two_weeks",               precision: 13, scale: 10
    t.decimal "dividend_yield",                     precision: 13, scale: 10
    t.decimal "low_fifty_two_weeks",                precision: 13, scale: 10
    t.decimal "market_cap",                         precision: 13, scale: 10
    t.text    "description",          limit: 65535
    t.text    "fundamentals_url",     limit: 65535
    t.date    "opening_date"
    t.date    "closing_date"
    t.integer "total_supply",         limit: 4,                               default: 0,   null: false
    t.integer "participant_limit",    limit: 4,                               default: 0,   null: false
    t.decimal "rights_for_revenue",                 precision: 13, scale: 10, default: 0.0
    t.decimal "fundraising_amount",                 precision: 13, scale: 10, default: 0.0
  end

  create_table "user_brokers", id: false, force: :cascade do |t|
    t.integer "id",         limit: 4,   default: 0, null: false
    t.string  "name",       limit: 255
    t.integer "users_id",   limit: 4,   default: 0, null: false
    t.string  "api_key",    limit: 250
    t.integer "deleted_id", limit: 4,   default: 0, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
<<<<<<< HEAD
=======
    t.string   "first_name",             limit: 250
    t.string   "last_name",              limit: 250
    t.string   "user_type",              limit: 250
>>>>>>> cd3a6a427134faee0b62aba3bdd543aa31672a06
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
