class ProductSerializer < ActiveModel::Serializer
    attributes :id, :name, :short_name, :price, :additional_price, :image, :catalog_image, :slug

    def short_name
        object.name.truncate(20)
    end

    def catalog_image
        object.image.for_catalog.to_s
    end

    def image
        object.image.to_s
    end
end
