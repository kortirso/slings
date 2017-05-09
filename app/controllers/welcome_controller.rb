class WelcomeController < ApplicationController    
    def index
        @categories = Category.where.not(name: 'Слинги с кольцами').order(name: :asc)
    end
end