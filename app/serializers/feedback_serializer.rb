class FeedbackSerializer < ActiveModel::Serializer
  attributes :id, :name, :body, :short_body, :image_content

  def short_body
    object.body.truncate(100)
  end
end
