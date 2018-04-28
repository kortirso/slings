class PositionSerializer < ActiveModel::Serializer
  attributes :id, :count, :summ, :full
  belongs_to :product
end
