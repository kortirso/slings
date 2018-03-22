class CartSerializer < ActiveModel::Serializer
  attributes :id, :summ, :coupon_name

  def coupon_name
    object.coupon.try(:name) || ''
  end
end
