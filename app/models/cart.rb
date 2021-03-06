# Represents cart of products
class Cart < ApplicationRecord
  belongs_to :coupon, optional: true

  has_many :positions, dependent: :destroy
  has_many :products, through: :positions

  has_one :order

  validates :summ, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def add_product(product_id)
    current_position = positions.find_by(product_id: product_id)
    current_position.present? ? current_position.update(count: current_position.count + 1) : positions.create(product_id: product_id)
    calc_summ
  end

  def calc_summ
    update(summ: positions.sum(&:summ))
    summ
  end

  def update_coupon(coupon)
    update(coupon: coupon)
    positions.each do |position|
      position.calc_summ
      position.save
    end
    calc_summ
  end
end
