class CategoriesController < ApplicationController
  before_action :categories_list
  before_action :find_category, only: %i[show]
  before_action :find_novelty_products, only: %i[index]
  before_action :find_category_products, only: %i[show]

  def index
    render_page
  end

  def show
    render_page
  end

  private def render_page
    respond_to do |format|
      format.html do
        render action_name
      end
      format.json do
        render json: {
          products: ActiveModel::Serializer::CollectionSerializer.new(@products, each_serializer: ProductSerializer),
          next_page: @products.next_page
        }, status: 200
      end
    end
  end

  private def find_category
    @category = Category.friendly.find(params[:id])
  end

  private def find_novelty_products
    @products = Product.lasts.page(select_page).per(8)
  end

  private def find_category_products
    @products = @category.products.lasts.page(select_page).per(8)
  end
end
