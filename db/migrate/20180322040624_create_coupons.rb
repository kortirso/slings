class CreateCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :coupons do |t|
      t.string :name
      t.datetime :started_at
      t.datetime :finished_at
      t.integer :amount, null: false, default: 100
      t.integer :collection_id
      t.integer :category_id
      t.integer :product_id
      t.integer :discount, null: false, default: 1
      t.timestamps
    end
    add_index :coupons, :collection_id
    add_index :coupons, :category_id
    add_index :coupons, :product_id

    add_column :carts, :coupon_id, :integer
    add_column :orders, :coupon_id, :integer
    add_index :carts, :coupon_id
    add_index :orders, :coupon_id
  end
end
