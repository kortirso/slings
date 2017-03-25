class PositionsController < ApplicationController
    before_action :get_categories_list

    def create
        @cart.add_product(params[:product_id])
    end
end