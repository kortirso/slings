class AddOrderToPositions < ActiveRecord::Migration[5.0]
    def change
        add_column :positions, :order_id, :integer
        add_index :positions, :order_id
    end
end
