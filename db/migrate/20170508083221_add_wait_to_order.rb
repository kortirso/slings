class AddWaitToOrder < ActiveRecord::Migration[5.0]
    def change
        add_column :deliveries, :wait, :boolean, default: false
    end
end
