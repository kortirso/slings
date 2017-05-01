class AddFullToPosition < ActiveRecord::Migration[5.0]
    def change
        add_column :positions, :full, :boolean, default: false
    end
end
