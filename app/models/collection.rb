# Represents collections of products
class Collection < ApplicationRecord
  has_many :products

  validates :name, presence: true
end
