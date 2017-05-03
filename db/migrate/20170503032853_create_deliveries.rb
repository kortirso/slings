class CreateDeliveries < ActiveRecord::Migration[5.0]
    def change
        create_table :deliveries do |t|
            t.integer :order_id
            t.string :owner_name, null: false, default: ''
            t.string :phone, null: false, default: ''
            t.timestamps
        end
        add_index :deliveries, :order_id
    end
end
