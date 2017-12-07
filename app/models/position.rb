# Represents positions in cart
class Position < ApplicationRecord
    PRICE_FOR_FULL = 499

    belongs_to :cart
    belongs_to :product
    belongs_to :order

    validates :product_id, :count, :cart_id, presence: true
    validates :count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

    before_save :calc_summ

    def change_count(koef)
        update(count: count + koef)
        recalc_cart
        self
    end

    def change_fullness
        update(full: !full?)
        recalc_cart
        self
    end

    def removing
        destroy
        recalc_cart
    end

    def recalc_cart
        cart.calc_summ
    end

    private

    def calc_summ
        self.summ = count * product.price
        self.summ += count * PRICE_FOR_FULL if full?
    end
end
