class Position < ApplicationRecord
    belongs_to :cart
    belongs_to :product

    validates :cart_id, :product_id, :count, presence: true
    validates :count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

    before_save :calc_summ

    private

    def calc_summ
        self.summ = self.count * self.product.price
    end
end
