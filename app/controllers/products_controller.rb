class ProductsController < ApplicationController
    before_action :categories_list, unless: :format_json?
    before_action :find_product

    def show
        respond_to do |format|
            format.html
            format.json do
                render json: @product, serializer: ProductSerializer, status: 200
            end
        end
    end

    private def find_product
        @product = Product.friendly.find(params[:id])
    end
end
