class AddImageToPhotos < ActiveRecord::Migration[5.1]
    def change
        add_column :instaphotos, :image, :string
    end
end
