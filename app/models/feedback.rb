# Represents feedbacks by users
class Feedback < ApplicationRecord
    mount_uploader :image, FeedbacksUploader

    validates :body, presence: true

    scope :lasts, -> { order(created_at: :asc).limit(4) }
end
