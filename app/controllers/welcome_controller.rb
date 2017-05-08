class WelcomeController < ApplicationController
    def index
        @sales_hits = Product.sales_hits.order(updated_at: :desc).limit(4)
    end
end