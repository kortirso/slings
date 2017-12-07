class ArticlesController < ApplicationController
    def index
        @articles = Article.order(id: :desc)
    end

    def show
        @article = Article.friendly.find(params[:id])
    end
end
