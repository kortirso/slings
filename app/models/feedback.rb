# Represents feedbacks by users
class Feedback < ApplicationRecord
    mount_uploader :image, FeedbacksUploader

    validates :body, presence: true

    scope :lasts, -> { order(created_at: :desc).limit(4) }
    scope :published, -> { where(published: true) }
end
