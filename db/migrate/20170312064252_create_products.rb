class CreateProducts < ActiveRecord::Migration[5.0]
    def change
        create_table :products do |t|
            t.string :name, default: '', null: false
            t.text :caption
            t.integer :price, default: 0, null: false
            t.boolean :new_one, default: false
            t.boolean :sales_hit, default: false
            t.integer :amount, default: 0, null: false
            t.timestamps
        end
    end
end
