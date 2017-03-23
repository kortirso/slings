class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include ProductsCart
    
    before_action :set_products_cart

    rescue_from ActionController::RoutingError, with: :render_not_found
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def catch_404
        raise ActionController::RoutingError.new(params[:path])
    end

    private

    def get_categories_list
        @categories = Category.order(id: :asc)
    end

    def render_not_found
        render template: 'shared/404', status: 404
    end
end
