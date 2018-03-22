# Represents coupons for discounts
class Coupon < ApplicationRecord
  belongs_to :collection, optional: true
  belongs_to :category, optional: true
  belongs_to :product, optional: true

  has_many :carts
  has_many :orders, through: :carts

  validates :name, :amount, :discount, presence: true
  validates :amount, :discount, numericality: { only_integer: true }
end
