class Cart < ApplicationRecord
    has_many :positions
    has_many :products, through: :positions

    has_one :order

    validates :summ, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

    def add_product(product_id)
        current_position = positions.find_by(product_id: product_id)
        current_position.present? ? current_position.update(count: current_position.count + 1) : current_position = positions.create!(product_id: product_id)
        self.calc_summ
    end

    def calc_summ
        self.update(summ: positions.sum(&:summ))
        summ
    end
end
