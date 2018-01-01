class CartsController < ApplicationController
    before_action :check_cart
    before_action :find_positions

    def show
        respond_to do |format|
            format.html do
                @order = Order.new
                @delivery = @order.build_delivery
            end
            format.json do
                render json: {
                    positions: ActiveModel::Serializer::CollectionSerializer.new(@positions, each_serializer: PositionSerializer)
                }, status: 200
            end
        end
    end

    private

    def check_cart
        render_not_found if params[:id].to_i != session[:cart_id]
    end

    def find_positions
        @positions = @cart.positions.includes(:product).order(id: :asc)
    end
end
