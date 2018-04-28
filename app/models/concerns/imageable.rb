# Add active storage images to models
module Imageable
  extend ActiveSupport::Concern

  included do
    has_one_attached :image
  end

  def image_content
    image.attached? ? Base64.encode64(image.attachment.blob.download) : nil
  end
end
