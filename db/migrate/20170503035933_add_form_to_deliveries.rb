class AddFormToDeliveries < ActiveRecord::Migration[5.0]
    def change
        add_column :deliveries, :delivery_form, :string, null: false, default: ''
    end
end
