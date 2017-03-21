class ProductsController < ApplicationController
    before_action :get_categories_list

    def show
        @product = Product.friendly.find(params[:id])
    end
end