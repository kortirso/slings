class Delivery < ApplicationRecord
    COST_TEK = 500
    COST_POST = 300
    COST_SELF = 0
    DISCOUNT = 5

    belongs_to :order

    validates :order_id, presence: true

    def delivery_cost
        case self.delivery_form
            when 'Доставка Транспортной Компанией' then COST_TEK
            when 'Доставка Почтой России' then COST_POST
            when 'Самовывоз' then COST_SELF
        end
    end

    def discount
        can_wait? ? DISCOUNT : 0
    end

    def can_wait?
        wait
    end

    def self.has_option_for_wait?
        Date.current.mday < 18
    end
end
