class CreateOrderService
    def self.call(params)
        order = Order.create params[:order]
        return nil if order.nil?

        delivery = Delivery.create params[:delivery].merge(order_id: order.id)
        return nil if delivery.nil?

        order.update(summ: (order.summ + delivery.delivery_cost) * (100 - delivery.discount) / 100)
        order.cart.positions.includes(:product).each do |position|
            order.positions.create product: position.product, count: position.count, full: position.full
        end
        order
    end
end