class WelcomeController < ApplicationController
    def index
        @categories = Category.order(name: :asc)
    end
end