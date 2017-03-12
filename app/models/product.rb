class Product < ApplicationRecord
    belongs_to :category

    validates :name, presence: true, uniqueness: true
    validates :category_id, presence: true
    validates :price, :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

    def is_new_product?
        new_one
    end

    def is_sales_hit?
        sales_hit
    end

    def is_available_for_order?
        amount > 0
    end
end
