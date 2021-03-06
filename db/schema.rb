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

ActiveRecord::Schema.define(version: 2018_04_28_014956) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "caption"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_articles_on_slug", unique: true
  end

  create_table "carts", force: :cascade do |t|
    t.integer "summ", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "coupon_id"
    t.index ["coupon_id"], name: "index_carts_on_coupon_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "caption"
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "collections", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "configs", force: :cascade do |t|
    t.integer "discount", default: 5
    t.integer "cost_self", default: 0
    t.integer "cost_post", default: 300
    t.integer "cost_tek", default: 500
    t.integer "price_full", default: 499
    t.integer "price_mai_full", default: 150
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.string "name"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.integer "amount", default: 100, null: false
    t.integer "collection_id"
    t.integer "category_id"
    t.integer "product_id"
    t.integer "discount", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_coupons_on_category_id"
    t.index ["collection_id"], name: "index_coupons_on_collection_id"
    t.index ["product_id"], name: "index_coupons_on_product_id"
  end

  create_table "deliveries", force: :cascade do |t|
    t.integer "order_id"
    t.string "owner_name", default: "", null: false
    t.string "phone", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "delivery_form", default: "", null: false
    t.text "passport"
    t.text "address"
    t.boolean "wait", default: false
    t.index ["order_id"], name: "index_deliveries_on_order_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string "name", default: ""
    t.text "body", default: ""
    t.boolean "published", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "instagrams", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instaphotos", force: :cascade do |t|
    t.integer "instagram_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.string "link", default: ""
    t.index ["instagram_id"], name: "index_instaphotos_on_instagram_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "cart_id"
    t.integer "summ", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "coupon_id"
    t.index ["cart_id"], name: "index_orders_on_cart_id"
    t.index ["coupon_id"], name: "index_orders_on_coupon_id"
  end

  create_table "positions", force: :cascade do |t|
    t.integer "cart_id"
    t.integer "product_id"
    t.integer "count", default: 1, null: false
    t.integer "summ"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "full", default: false
    t.integer "order_id"
    t.index ["cart_id"], name: "index_positions_on_cart_id"
    t.index ["order_id"], name: "index_positions_on_order_id"
    t.index ["product_id"], name: "index_positions_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "caption"
    t.integer "price", default: 0, null: false
    t.boolean "new_one", default: false
    t.boolean "sales_hit", default: false
    t.integer "amount", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.string "slug"
    t.string "material", default: "", null: false
    t.string "model", default: "", null: false
    t.integer "collection_id"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["collection_id"], name: "index_products_on_collection_id"
    t.index ["slug"], name: "index_products_on_slug", unique: true
  end

end
