class CreateArticles < ActiveRecord::Migration[5.0]
    def change
        create_table :articles do |t|
            t.string :name, null: false, default: ''
            t.text :caption
            t.string :slug
            t.timestamps
        end
        add_index :articles, :slug, unique: true
    end
end
