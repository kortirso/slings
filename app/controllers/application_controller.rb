class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    prepend_view_path Rails.root.join('frontend')

    include ProductsCart

    before_action :set_products_cart

    rescue_from ActionController::RoutingError, with: :render_not_found
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def catch_404
        raise ActionController::RoutingError.new(params[:path]), 'route error'
    end

    private

    def categories_list
        @categories = Category.category_order
    end

    def render_not_found
        render template: 'shared/404', status: 404
    end

    def select_page
        params[:page].nil? ? 1 : params[:page]
    end
end
