class CategoriesController < ApplicationController
    def index
        @categories = Category.order(name: :asc)
    end

    def show
        @category = Category.friendly.find(params[:id])
        @products = @category.products
    end
end