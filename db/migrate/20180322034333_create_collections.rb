class CreateCollections < ActiveRecord::Migration[5.1]
  def change
    create_table :collections do |t|
      t.string :name, null: false, default: ''
      t.timestamps
    end
    add_column :products, :collection_id, :integer
    add_index :products, :collection_id
  end
end
