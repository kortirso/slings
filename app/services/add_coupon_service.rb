class AddCouponService
  attr_reader :cart, :coupon

  def initialize(args = {})
    @cart = args[:cart]
    @coupon = args[:coupon]
  end

  def recalc_cart
    return cart if DateTime.now < coupon.started_at
    return cart if DateTime.now > coupon.finished_at
    return cart if coupon.amount <= 0
    cart.update(coupon: coupon)
    cart.positions.each do |position|
      position.calc_summ
      position.save
    end
    cart.calc_summ
    cart
  end
end