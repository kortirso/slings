# Service object for creating order
class CreateOrderService
  class << self
    def call(args = {})
      order = Order.create(args[:order])
      return nil if order.nil?

      delivery = Delivery.create(args[:delivery].merge(order_id: order.id))
      return nil if delivery.nil?

      order.update(summ: order.summ * (100 - delivery.discount) / 100 + delivery.delivery_cost)
      order.cart.positions.includes(:product).each { |position| order.positions.create(product: position.product, count: position.count, full: position.full) }

      order.cart.coupon.attach if order.cart.coupon.present?

      AdminMailer.new_order_email(order: order, delivery: delivery)

      order
    end
  end
end
