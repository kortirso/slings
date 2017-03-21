class CategoriesController < ApplicationController
    before_action :get_categories_list

    def index
        
    end

    def show
        @category = Category.friendly.find(params[:id])
        @products = @category.products
    end
end