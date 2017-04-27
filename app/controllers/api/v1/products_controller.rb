class Api::V1::ProductsController < Api::V1::BaseController
    skip_before_action :verify_authenticity_token
    before_action :authenticate_token
    before_action :find_category

    def create
        product = Product.build({params: product_params.merge(category: @category), image: params[:image]})
        if product
            render json: { success: 'Product is created' }
        else
            render json: { error: 'Cant create product' }
        end
    end

    private

    def find_category
        @category = Category.find_by(name: params[:category_name])
        render json: { error: 'No such category' } if @category.nil?
    end

    def product_params
        params.permit(:name, :caption, :price)
    end
end