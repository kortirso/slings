class FeedbackSerializer < ActiveModel::Serializer
    attributes :id, :name, :body, :image, :short_body

    def image
        object.image.to_s
    end

    def short_body
        object.body.truncate(100)
    end
end
