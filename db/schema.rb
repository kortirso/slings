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

ActiveRecord::Schema.define(version: 20170503145329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.integer  "summ",       default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "slug"
    t.string   "image"
    t.string   "caption"
    t.index ["slug"], name: "index_categories_on_slug", unique: true, using: :btree
  end

  create_table "deliveries", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "owner_name",    default: "", null: false
    t.string   "phone",         default: "", null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "delivery_form", default: "", null: false
    t.text     "passport"
    t.text     "address"
    t.index ["order_id"], name: "index_deliveries_on_order_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "name",       default: "", null: false
    t.integer  "discount",   default: 0,  null: false
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "summ",       default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["cart_id"], name: "index_orders_on_cart_id", using: :btree
  end

  create_table "positions", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.integer  "count",      default: 1,     null: false
    t.integer  "summ"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "full",       default: false
    t.integer  "order_id"
    t.index ["cart_id"], name: "index_positions_on_cart_id", using: :btree
    t.index ["order_id"], name: "index_positions_on_order_id", using: :btree
    t.index ["product_id"], name: "index_positions_on_product_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",        default: "",    null: false
    t.text     "caption"
    t.integer  "price",       default: 0,     null: false
    t.boolean  "new_one",     default: false
    t.boolean  "sales_hit",   default: false
    t.integer  "amount",      default: 0,     null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "category_id"
    t.integer  "event_id"
    t.string   "slug"
    t.string   "image"
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
    t.index ["event_id"], name: "index_products_on_event_id", using: :btree
    t.index ["slug"], name: "index_products_on_slug", unique: true, using: :btree
  end

end
