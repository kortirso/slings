class AddMaterialToProducts < ActiveRecord::Migration[5.1]
    def change
        add_column :products, :material, :string, null: false, default: ''
        add_column :products, :model, :string, null: false, default: ''
    end
end
