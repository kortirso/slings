# Represents orders
class Order < ApplicationRecord
    belongs_to :cart

    has_many :positions, dependent: :destroy
    has_many :products, through: :positions

    has_one :delivery

    validates :cart_id, presence: true

    after_commit :update_summ, on: :create

    def update_summ
        self.summ = cart.summ
    end
end
