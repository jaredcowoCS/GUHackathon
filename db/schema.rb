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

ActiveRecord::Schema.define(version: 20161030071158) do

  create_table "balances", force: :cascade do |t|
    t.integer  "shop_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.decimal  "amount_cents", default: 0.0, null: false
    t.integer  "user_id"
  end

  add_index "balances", ["shop_id"], name: "index_balances_on_shop_id"
  add_index "balances", ["user_id"], name: "index_balances_on_user_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "codes", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "code"
    t.decimal  "value",       precision: 8, scale: 2
    t.decimal  "value_cents"
  end

  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "purchase_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "orders", ["purchase_id"], name: "index_orders_on_purchase_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "price"
    t.integer  "quantity"
    t.text     "description"
    t.integer  "shop_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "product"
    t.string   "product_image"
    t.decimal  "price_cents"
    t.integer  "user_id"
    t.integer  "district_id"
  end

  add_index "products", ["district_id"], name: "index_products_on_district_id"
  add_index "products", ["shop_id"], name: "index_products_on_shop_id"
  add_index "products", ["user_id"], name: "index_products_on_user_id"

  create_table "purchases", force: :cascade do |t|
    t.integer  "code_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "seller_id"
    t.integer  "buyer_id"
  end

  add_index "purchases", ["buyer_id"], name: "index_purchases_on_buyer_id"
  add_index "purchases", ["code_id"], name: "index_purchases_on_code_id"
  add_index "purchases", ["product_id"], name: "index_purchases_on_product_id"
  add_index "purchases", ["seller_id"], name: "index_purchases_on_seller_id"

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
    t.integer  "seller_id"
    t.integer  "buyer_id"
    t.integer  "district_id"
    t.string   "name"
    t.string   "profile_image"
    t.string   "address"
    t.integer  "category_id"
    t.integer  "role"
    t.string   "phone"
  end

  add_index "users", ["buyer_id"], name: "index_users_on_buyer_id"
  add_index "users", ["category_id"], name: "index_users_on_category_id"
  add_index "users", ["district_id"], name: "index_users_on_district_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["seller_id"], name: "index_users_on_seller_id"

end
