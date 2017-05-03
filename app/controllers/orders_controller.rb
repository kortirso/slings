class OrdersController < ApplicationController
    before_action :find_order, only: :show

    def show

    end
    
    def create
        order = CreateOrderService.call({order: order_params, delivery: delivery_params})
        if order.nil?
            redirect_to @cart
        else
            redirect_to order
        end
    end

    private

    def find_order
        @order = Order.find(params[:id])
    end

    def order_params
        params.permit(:cart_id)
    end

    def delivery_params
        params.permit(:delivery_form, :owner_name, :phone, :passport, :address)
    end
end