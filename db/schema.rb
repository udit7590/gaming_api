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

ActiveRecord::Schema.define(version: 20160503160635) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coupons", force: :cascade do |t|
    t.integer  "coupon_vendor_id"
    t.string   "code"
    t.string   "title"
    t.string   "company_name"
    t.string   "company_website"
    t.string   "availability"
    t.text     "details"
    t.text     "conditions"
    t.integer  "discount_amount"
    t.decimal  "discount_percentage"
    t.integer  "min_purchase"
    t.datetime "valid_from"
    t.datetime "valid_till"
    t.boolean  "one_time",            default: true
    t.boolean  "editable",            default: true
    t.boolean  "active",              default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coupons_winning_rules", force: :cascade do |t|
    t.integer  "winning_rule_id"
    t.integer  "coupon_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "coupons_winning_rules", ["coupon_id"], name: "index_coupons_winning_rules_on_coupon_id", using: :btree
  add_index "coupons_winning_rules", ["winning_rule_id"], name: "index_coupons_winning_rules_on_winning_rule_id", using: :btree

  create_table "gamer_devices", force: :cascade do |t|
    t.integer  "gamer_id"
    t.string   "token"
    t.string   "primary_email"
    t.string   "model"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gamer_devices", ["gamer_id"], name: "index_gamer_devices_on_gamer_id", using: :btree

  create_table "gamer_winning_histories", force: :cascade do |t|
    t.integer  "gamer_id"
    t.integer  "winning_rule_id"
    t.integer  "gaming_vendor_id"
    t.integer  "coupon_id"
    t.boolean  "used",             default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gamer_winning_histories", ["coupon_id"], name: "index_gamer_winning_histories_on_coupon_id", using: :btree
  add_index "gamer_winning_histories", ["gamer_id"], name: "index_gamer_winning_histories_on_gamer_id", using: :btree
  add_index "gamer_winning_histories", ["gaming_vendor_id"], name: "index_gamer_winning_histories_on_gaming_vendor_id", using: :btree
  add_index "gamer_winning_histories", ["winning_rule_id"], name: "index_gamer_winning_histories_on_winning_rule_id", using: :btree

  create_table "gamers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "auth_key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gamers_vendors", force: :cascade do |t|
    t.integer  "gamer_id"
    t.integer  "vendor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gamers_vendors", ["gamer_id"], name: "index_gamers_vendors_on_gamer_id", using: :btree
  add_index "gamers_vendors", ["vendor_id"], name: "index_gamers_vendors_on_vendor_id", using: :btree

  create_table "gaming_vendor_coupons", force: :cascade do |t|
    t.integer  "gaming_vendor_id"
    t.integer  "coupon_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gaming_vendor_coupons", ["coupon_id"], name: "index_gaming_vendor_coupons_on_coupon_id", using: :btree
  add_index "gaming_vendor_coupons", ["gaming_vendor_id"], name: "index_gaming_vendor_coupons_on_gaming_vendor_id", using: :btree

  create_table "vendors", force: :cascade do |t|
    t.string   "email",                   default: "",   null: false
    t.string   "encrypted_password",      default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",         default: 0,    null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.boolean  "active",                  default: true
    t.string   "game_name"
    t.string   "company_name"
    t.string   "test_api_normal_key"
    t.string   "test_api_privileged_key"
    t.string   "live_api_normal_key"
    t.string   "live_api_privileged_key"
    t.string   "phone"
    t.string   "type"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "vendors", ["confirmation_token"], name: "index_vendors_on_confirmation_token", unique: true, using: :btree
  add_index "vendors", ["email"], name: "index_vendors_on_email", unique: true, using: :btree
  add_index "vendors", ["reset_password_token"], name: "index_vendors_on_reset_password_token", unique: true, using: :btree
  add_index "vendors", ["unlock_token"], name: "index_vendors_on_unlock_token", unique: true, using: :btree

  create_table "winning_rules", force: :cascade do |t|
    t.integer  "gaming_vendor_id"
    t.integer  "coupon_id"
    t.string   "type"
    t.string   "name"
    t.text     "description"
    t.boolean  "active",           default: true
    t.integer  "level"
    t.integer  "points"
    t.integer  "max_rating"
    t.integer  "given_rating"
    t.integer  "times_played"
    t.datetime "played_from"
    t.datetime "played_last"
    t.integer  "play_duration"
    t.decimal  "percentage"
    t.string   "trophy"
    t.string   "realm"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "winning_rules", ["coupon_id"], name: "index_winning_rules_on_coupon_id", using: :btree
  add_index "winning_rules", ["gaming_vendor_id"], name: "index_winning_rules_on_gaming_vendor_id", using: :btree

end
