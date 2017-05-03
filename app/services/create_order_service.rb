class CreateOrderService
    def self.call(params)
        order = Order.create params[:order]
        return nil if order.nil?
        delivery = Delivery.create params[:delivery].merge(order_id: order.id)
        return nil if delivery.nil?
        order
    end
end