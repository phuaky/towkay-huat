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

ActiveRecord::Schema.define(version: 20161102034316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "all_seafood_stocks", force: :cascade do |t|
    t.integer  "stall_id"
    t.integer  "fish_id"
    t.integer  "volume_kg"
    t.integer  "price_dollarsPerKg"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.string   "stall_id"
    t.string   "customer_id"
    t.string   "fish_id"
    t.string   "quantity"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "customers", force: :cascade do |t|
    t.integer  "user_profile_id"
    t.integer  "fish_id"
    t.integer  "qty_kg"
    t.integer  "price_dollarsPerKg"
    t.integer  "net_amt"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "fish", force: :cascade do |t|
    t.string   "english"
    t.string   "malay"
    t.string   "chinese"
    t.text     "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.decimal  "unit_price",  precision: 12, scale: 3
    t.integer  "quantity"
    t.decimal  "total_price", precision: 12, scale: 3
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
    t.index ["product_id"], name: "index_order_items_on_product_id", using: :btree
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal",        precision: 12, scale: 3
    t.decimal  "tax",             precision: 12, scale: 3
    t.decimal  "shipping",        precision: 12, scale: 3
    t.decimal  "total",           precision: 12, scale: 3
    t.integer  "order_status_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",      precision: 12, scale: 3
    t.boolean  "active"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "recorded_trades", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "stall_id"
    t.integer  "fish_id"
    t.integer  "sell_kg"
    t.integer  "price_dollarsPerKg"
    t.integer  "net_amt"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "stalls", force: :cascade do |t|
    t.integer  "user_profile_id"
    t.string   "name"
    t.string   "owner"
    t.string   "credibility"
    t.string   "quality"
    t.integer  "qtyUploaded_kg"
    t.integer  "qtySold_kg"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "user_classes", force: :cascade do |t|
    t.string   "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "firstName"
    t.string   "lastName"
    t.integer  "handphone"
    t.integer  "user_class_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "order_statuses"
end
