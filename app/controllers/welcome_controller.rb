class WelcomeController < ApplicationController    
    def index
        @categories = Category.where.not(name: 'Слинги с кольцами').order(name: :asc)
        @articles = Article.order(id: :desc).limit(3)
    end
end