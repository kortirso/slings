class CreateEvents < ActiveRecord::Migration[5.0]
    def change
        create_table :events do |t|
            t.string :name, default: '', null: false
            t.integer :discount, default: 0, null: false
            t.date :start_date
            t.date :end_date
            t.timestamps
        end
        add_column :products, :event_id, :integer
        add_index :products, :event_id
    end
end
