class CategoriesController < ApplicationController
    before_action :categories_list
    before_action :find_category, only: %i[show]

    def index
        @new_ones = Product.lasts.limit(8)
    end

    def show
        respond_to do |format|
            format.html
            format.json do
                products = @category.products.lasts.page(select_page).per(8)
                render json: {
                    products: ActiveModel::Serializer::CollectionSerializer.new(products, each_serializer: ProductSerializer),
                    next_page: products.next_page
                }, status: 200
            end
        end
    end

    private

    def find_category
        @category = Category.friendly.find(params[:id])
    end

    def select_page
        params[:page].nil? ? 1 : params[:page]
    end
end
