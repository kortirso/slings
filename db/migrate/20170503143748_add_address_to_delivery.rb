class AddAddressToDelivery < ActiveRecord::Migration[5.0]
    def change
        add_column :deliveries, :address, :text
    end
end
