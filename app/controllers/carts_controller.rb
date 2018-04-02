class CartsController < ApplicationController
  before_action :find_cart
  before_action :find_positions, only: %i[index], if: :format_json?
  before_action :find_coupon, only: %i[add_coupon]

  def index
    respond_to do |format|
      format.html do
        @order = Order.new
        @delivery = @order.build_delivery
      end
      format.json do
        render json: {
          positions: ActiveModel::Serializer::CollectionSerializer.new(@positions, each_serializer: PositionSerializer),
          cart: CartSerializer.new(@cart)
        }, status: 200
      end
    end
  end

  def add_coupon
    cart = AddCouponService.new(cart: @cart, coupon: @coupon).recalc_cart
    result = cart.coupon.nil? ? 'Coupons are gone' : 'Coupon is attached'
    render json: {
      result: result,
      positions: ActiveModel::Serializer::CollectionSerializer.new(cart.positions.includes(:product).order(id: :asc), each_serializer: PositionSerializer),
      cart: cart
    }, status: 200
  end

  private def find_cart
    @cart = Cart.find_by(id: session[:cart_id])
  end

  private def find_positions
    @positions = @cart.positions.includes(:product).order(id: :asc)
  end

  private def find_coupon
    @coupon = Coupon.find_by(name: params[:coupon])
    render json: { error: 'Coupon is not found' }, status: 404 if @coupon.nil?
  end
end
