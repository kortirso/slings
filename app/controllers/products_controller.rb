class ProductsController < ApplicationController
    before_action :categories_list

    def show
        @product = Product.friendly.find(params[:id])
    end
end
