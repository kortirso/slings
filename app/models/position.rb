class Position < ApplicationRecord
    PRICE_FOR_FULL = 499

    belongs_to :cart
    belongs_to :product
    belongs_to :order

    validates :product_id, :count, presence: true
    validates :count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

    before_save :calc_summ

    def is_full?
        full
    end

    def change_count(koef)
        self.update(count: self.count + koef)
        self.recalc_cart
        self
    end

    def change_fullness
        self.update(full: !self.full)
        self.recalc_cart
        self
    end

    def removing
        self.destroy
        self.recalc_cart
    end

    def recalc_cart
        self.cart.calc_summ
    end

    private

    def calc_summ
        self.summ = self.count * self.product.price
        self.summ += self.count * PRICE_FOR_FULL if is_full?
    end
end
