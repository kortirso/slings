class CreateConfigs < ActiveRecord::Migration[5.1]
    def change
        create_table :configs do |t|
            t.integer :discount, default: 5
            t.integer :cost_self, default: 0
            t.integer :cost_post, default: 300
            t.integer :cost_tek, default: 500
            t.integer :price_full, default: 499
            t.integer :price_mai_full, default: 150
            t.timestamps
        end
    end
end
