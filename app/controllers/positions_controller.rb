class PositionsController < ApplicationController
    before_action :get_categories_list
    before_action :find_position, except: [:create]

    def create
        @cart.add_product(params[:product_id])
    end

    def product_plus
        @position.change_count(1)
    end

    def product_minus
        @position.change_count(-1) if @position.count > 1
    end

    def product_full
        @position.change_fullness
    end

    private

    def find_position
        @position = Position.find_by(id: params[:position])
        nil if @position.nil?
    end
end