# Represents delivery options for orders
class Delivery < ApplicationRecord
    belongs_to :order

    validates :order_id, presence: true

    def delivery_cost
        case delivery_form
            when 'Доставка Транспортной Компанией' then Config.last.cost_tek
            when 'Доставка Почтой России' then Config.last.cost_post
            when 'Самовывоз' then Config.last.cost_self
            when 'Бесплатная доставка' then Config.last.cost_self
        end
    end

    def discount
        wait? ? Config.last.discount : 0
    end

    def self.option_for_wait?
        Date.current.mday < 18
    end
end
