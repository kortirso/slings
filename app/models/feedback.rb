# Represents feedbacks by users
class Feedback < ApplicationRecord
  include Imageable

  validates :body, presence: true

  scope :lasts, -> { order(updated_at: :desc).limit(4) }
  scope :published, -> { where(published: true) }
end
