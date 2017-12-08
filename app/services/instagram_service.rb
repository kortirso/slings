require 'net/http'

class InstagramService
    attr_reader :access_token, :user_id

    def initialize
        @access_token = ENV['INSTAGRAM_TOKEN']
        @user_id = ENV['INSTAGRAM_USER']
    end

    def insta_photos
        photos = user_recent.collect { |elem| elem['images']['standard_resolution']['url'] }
        [
            [photos[0], photos[1], photos[2]],
            [photos[3], photos[4], photos[5]],
            [photos[6], photos[7], photos[8]]
        ]
    end

    def user_recent
        uri = URI("https://api.instagram.com/v1/users/self/media/recent/?access_token=#{access_token}&count=9")
        req = Net::HTTP::Get.new(uri)
        resp = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http| http.request(req) }
        JSON.parse(resp.body)['data']
    end
end