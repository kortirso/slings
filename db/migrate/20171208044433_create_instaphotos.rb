class CreateInstaphotos < ActiveRecord::Migration[5.1]
    def change
        create_table :instaphotos do |t|
            t.integer :instagram_id
            t.timestamps
        end
        add_index :instaphotos, :instagram_id
    end
end
