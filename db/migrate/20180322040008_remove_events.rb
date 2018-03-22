class RemoveEvents < ActiveRecord::Migration[5.1]
  def change
    drop_table :events
    remove_column :products, :event_id
  end
end
