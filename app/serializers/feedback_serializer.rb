class FeedbackSerializer < ActiveModel::Serializer
    attributes :id, :name, :body, :image

    def image
        object.image.to_s
    end
end
