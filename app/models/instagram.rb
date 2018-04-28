# Represents collection of photos from instagram account
class Instagram < ApplicationRecord
  has_many :instaphotos, dependent: :destroy

  after_commit :create_photos, on: :create

  private def create_photos
    return if Rails.env.test?
    elements = InstagramService.new.insta_photos
    elements.each { |elem| instaphotos.create(image: elem[:photo], link: elem[:link]) }
  end
end
