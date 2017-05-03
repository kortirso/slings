class CreateOrderService
    def self.call(params)
        Order.where(cart_id: params[:order][:cart_id]).each do |order|
            order.positions.update_all(order_id: nil)
            order.destroy
        end

        order = Order.create params[:order]
        return nil if order.nil?

        delivery = Delivery.create params[:delivery].merge(order_id: order.id)
        return nil if delivery.nil?

        order.update(summ: order.summ + delivery.delivery_cost)
        order.cart.positions.update_all(order_id: order.id)
        order
    end
end