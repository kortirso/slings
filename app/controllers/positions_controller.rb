class PositionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[destroy product_plus product_minus product_full]
  before_action :find_position, except: %i[create]

  def create
    @cart.add_product(params[:product_id])
    render json: @cart.positions.sum(:count), status: 200
  end

  def destroy
    @position.removing
    render json: {
      positions: ActiveModel::Serializer::CollectionSerializer.new(@position.cart.positions, each_serializer: PositionSerializer),
      positions_amount: @position.cart.positions.sum(:count),
      cart_amount: @position.cart.summ
    }, status: 200
  end

  def product_plus
    @position.change_count(1)
    render_position
  end

  def product_minus
    @position.change_count(-1) if @position.count > 1
    render_position
  end

  def product_full
    @position.change_fullness
    render_position
  end

  private def find_position
    @position = Position.find_by(id: params[:id])
    render json: { error: 'Position does not exist' }, status: 404 if @position.nil?
  end

  private def render_position
    render json: {
      position: PositionSerializer.new(@position),
      positions_amount: @position.cart.positions.sum(:count),
      cart_amount: @position.cart.summ
    }, status: 200
  end
end
