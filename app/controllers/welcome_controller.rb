class WelcomeController < ApplicationController
  before_action :categories_list

  def index
    respond_to do |format|
      format.html do
        @articles = Article.order(id: :desc).limit(3)
        @insta_photos = Instagram.last.instaphotos.order(id: :asc).limit(9)
      end
      format.json do
        render json: { products: ActiveModel::Serializer::CollectionSerializer.new(Product.lasts.limit(4), each_serializer: ProductSerializer) }, status: 200
      end
    end
  end
end
