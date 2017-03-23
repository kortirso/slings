class AddImagesToTables < ActiveRecord::Migration[5.0]
    def change
        add_column :categories, :image, :string
        add_column :categories, :caption, :string
        add_column :products, :image, :string
    end
end
