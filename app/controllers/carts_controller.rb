class CartsController < ApplicationController
    before_action :check_cart

    def show
        @order = Order.new
        @delivery = @order.build_delivery
    end

    private

    def check_cart
        render_not_found if params[:id].to_i != session[:cart_id]
    end
end