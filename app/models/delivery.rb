class Delivery < ApplicationRecord
    belongs_to :order

    validates :order_id, presence: true
end
