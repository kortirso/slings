class AddLinkToInstaphotos < ActiveRecord::Migration[5.1]
    def change
        add_column :instaphotos, :link, :string, default: ''
    end
end
