class AddPassportToDelivery < ActiveRecord::Migration[5.0]
    def change
        add_column :deliveries, :passport, :text
    end
end
