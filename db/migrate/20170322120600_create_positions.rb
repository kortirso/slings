class CreatePositions < ActiveRecord::Migration[5.0]
    def change
        create_table :positions do |t|
            t.integer :cart_id
            t.integer :product_id
            t.integer :count, null: false, default: 1
            t.integer :summ
            t.timestamps
        end
        add_index :positions, :cart_id
        add_index :positions, :product_id
    end
end
