# Represents events in shop
class Event < ApplicationRecord
    has_many :products

    validates :name, presence: true, uniqueness: true
    validates :discount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
