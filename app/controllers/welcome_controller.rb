class WelcomeController < ApplicationController    
    def index
        @categories = Category.where('name != ? AND name != ?', 'Слинги с кольцами', 'Ткани').order(name: :asc)
        @articles = Article.order(id: :desc).limit(3)
    end
end