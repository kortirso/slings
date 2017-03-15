require 'babosa'

class Product < ApplicationRecord
    extend FriendlyId

    friendly_id :slug_candidates, use: :slugged

    belongs_to :category
    belongs_to :event

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

    def slug_candidates
        [:name, [:name, :id]]
    end

    def normalize_friendly_id(input)
        input.to_s.to_slug.normalize(transliterations: :russian).to_s
    end
end
