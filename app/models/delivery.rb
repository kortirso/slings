# Represents delivery options for orders
class Delivery < ApplicationRecord
    belongs_to :order

    validates :order_id, presence: true

    def delivery_cost
        case delivery_form
            when 'Доставка Транспортной Компанией' then Config.first.cost_tek
            when 'Доставка Почтой России' then Config.first.cost_post
            when 'Самовывоз' then Config.first.cost_self
        end
    end

    def discount
        wait? ? Config.first.discount : 0
    end

    def self.option_for_wait?
        Date.current.mday < 18
    end
end
