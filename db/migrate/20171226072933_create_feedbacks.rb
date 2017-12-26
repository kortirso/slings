class CreateFeedbacks < ActiveRecord::Migration[5.1]
    def change
        create_table :feedbacks do |t|
            t.string :image
            t.string :name, default: ''
            t.text :body, default: ''
            t.boolean :published, default: false
            t.timestamps
        end
    end
end
