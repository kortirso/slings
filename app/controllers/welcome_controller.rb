class WelcomeController < ApplicationController
    def index
        @categories = Category.order(id: :asc)
    end
end