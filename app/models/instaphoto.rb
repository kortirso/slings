# Represents instagram image
class Instaphoto < ApplicationRecord
  belongs_to :instagram

  validates :instagram_id, presence: true
end
