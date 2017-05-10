class OrdersController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :create
    before_action :find_order, only: :show
    before_action :check_owner, only: :show

    def show

    end
    
    def create
        order = CreateOrderService.call({order: { cart_id: session[:cart_id] }, delivery: delivery_params})
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

    def check_owner
        render_not_found if @order.cart_id != @cart.id
    end

    def delivery_params
        params.permit(:wait, :delivery_form, :owner_name, :phone, :passport, :address)
    end
end