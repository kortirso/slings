# Represents collection of photos from instagram account
class Instagram < ApplicationRecord
    has_many :instaphotos, dependent: :destroy

    after_commit :create_photos, on: :create

    def insta_photos
        photos = instaphotos.to_a
        [
            [photos[0], photos[1], photos[2]],
            [photos[3], photos[4], photos[5]],
            [photos[6], photos[7], photos[8]]
        ]
    end

    private def create_photos
        elements = InstagramService.new.insta_photos
        elements.each { |elem| instaphotos.create(image: elem[:photo], link: elem[:link]) }
    end
end
