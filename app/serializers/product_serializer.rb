class ProductSerializer < ActiveModel::Serializer
    attributes :id, :name, :short_name, :price, :additional_price, :image, :catalog_image, :slug, :caption, :material, :model, :collection_name

    def short_name
        object.name.truncate(20)
    end

    def catalog_image
        object.image.for_catalog.to_s
    end

    def image
        object.image.to_s
    end

    def caption
        object.caption.lines
    end

    def collection_name
        object.collection.try(:name)
    end
end
