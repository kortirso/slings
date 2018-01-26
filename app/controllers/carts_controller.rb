class CartsController < ApplicationController
    before_action :find_positions, if: :format_json?

    def index
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

    private def find_positions
        @positions = Cart.find_by(id: session[:cart_id]).positions.includes(:product).order(id: :asc)
    end
end
