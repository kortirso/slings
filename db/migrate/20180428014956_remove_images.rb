class RemoveImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :image
    remove_column :categories, :image
    remove_column :feedbacks, :image
  end
end
