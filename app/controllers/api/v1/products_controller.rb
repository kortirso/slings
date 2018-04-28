module Api
  module V1
    class ProductsController < Api::V1::BaseController
      skip_before_action :verify_authenticity_token
      before_action :authenticate_token
      before_action :find_category, except: :destroy
      before_action :find_product, except: :create

      def create
        product = Product.build(params: product_params.merge(category: @category), image: params[:image])
        if product
          render json: { product: ProductSerializer.new(product) }
        else
          render json: { error: 'Cant create product' }
        end
      end

      def update
        if @product.update(product_params.merge(category: @category))
          render json: { product: ProductSerializer.new(@product) }
        else
          render json: { error: 'Cant create product' }
        end
      end

      def destroy
        @product.destroy
      end

      private def find_category
        @category = Category.find_by(name: params[:category_name])
        render json: { error: 'No such category' } if @category.nil?
      end

      private def find_product
        @product = Product.find_by(id: params[:id])
        render json: { error: 'No such product' } if @product.nil?
      end

      private def product_params
        params.permit(:name, :caption, :price)
      end
    end
  end
end
