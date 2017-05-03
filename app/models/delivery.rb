class Delivery < ApplicationRecord
    COST_TEK = 500
    COST_POST = 300
    COST_SELF = 0

    belongs_to :order

    validates :order_id, presence: true

    def delivery_cost
        case self.delivery_form
            when 'Доставка Транспортной Компанией' then COST_TEK
            when 'Доставка Почтой России' then COST_POST
            when 'Самовывоз' then COST_SELF
        end
    end
end
