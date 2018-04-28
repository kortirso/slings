class FeedbackSerializer < ActiveModel::Serializer
  attributes :id, :name, :body, :short_body

  def short_body
    object.body.truncate(100)
  end
end
