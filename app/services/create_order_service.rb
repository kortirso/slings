class CreateOrderService
    def self.call(params)
        order = Order.create params[:order]
        return nil if order.nil?

        delivery = Delivery.create params[:delivery].merge(order_id: order.id)
        return nil if delivery.nil?

        order.update(summ: order.summ * (100 - delivery.discount) / 100 + delivery.delivery_cost)
        order.cart.positions.includes(:product).each do |position|
            order.positions.create product: position.product, count: position.count, full: position.full
        end
        order
    end
end