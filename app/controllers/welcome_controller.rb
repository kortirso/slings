class WelcomeController < ApplicationController
  before_action :categories_list

  def index
    @articles = Article.order(id: :desc).limit(3)
    @insta_photos = Instagram.last.instaphotos.order(id: :asc).limit(9)
    @last_products = Product.lasts.limit(4)
  end
end
