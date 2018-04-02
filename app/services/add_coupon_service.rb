class AddCouponService
  attr_reader :cart, :coupon

  def initialize(args = {})
    @cart = args[:cart]
    @coupon = args[:coupon]
  end

  def recalc_cart
    cart.update_coupon(nil)
    return cart if DateTime.now < coupon.started_at
    return cart if DateTime.now > coupon.finished_at
    return cart if coupon.amount <= 0
    cart.update_coupon(coupon)
    cart
  end
end