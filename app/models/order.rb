class Order < ApplicationRecord
    belongs_to :cart

    has_one :delivery

    validates :cart_id, presence: true

    before_create :update_summ

    def update_summ
        self.summ = self.cart.summ
    end
end
