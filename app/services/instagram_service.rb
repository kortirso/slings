require 'net/http'

# Service for getting links to last 9 images from instagram account
class InstagramService
    attr_reader :access_token, :user_id

    def initialize
        @access_token = ENV['INSTAGRAM_TOKEN']
        @user_id = ENV['INSTAGRAM_USER']
    end

    def insta_photos
        user_recent.collect { |elem| { photo: elem['images']['standard_resolution']['url'], link: elem['link'] } }
    end

    private def user_recent
        uri = URI("https://api.instagram.com/v1/users/self/media/recent/?access_token=#{access_token}&count=9")
        req = Net::HTTP::Get.new(uri)
        resp = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http| http.request(req) }
        JSON.parse(resp.body)['data']
    end
end
