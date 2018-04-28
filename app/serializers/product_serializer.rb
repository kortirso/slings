class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :short_name, :price, :additional_price, :slug, :caption, :material, :model, :collection_name, :image_content

  def short_name
    object.name.truncate(20)
  end

  def caption
    object.caption.lines
  end

  def collection_name
    object.collection.try(:name)
  end
end
