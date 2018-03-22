# Represents positions in cart
class Position < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  belongs_to :order

  validates :product_id, :count, presence: true
  validates :count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  before_save :calc_summ

  def change_count(koef)
    update(count: count + koef)
    recalc_cart
    self
  end

  def change_fullness
    update(full: !full?)
    recalc_cart
    self
  end

  def removing
    destroy
    recalc_cart
  end

  def recalc_cart
    cart.calc_summ
  end

  def calc_summ
    self.summ = count * (product.price * (100 - discount) / 100)
    self.summ += count * product.additional_price if full?
  end

  private def discount
    coupon = cart.nil? ? order.cart.coupon : cart.coupon
    return 100 if coupon.nil?
    return coupon.discount if coupon.collection.present? && coupon.collection == product.collection
    return coupon.discount if coupon.category.present? && coupon.category == product.category
    return coupon.discount if coupon.product.present? && coupon.product == product
    100
  end
end
