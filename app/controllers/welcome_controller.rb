class WelcomeController < ApplicationController
    before_action :categories_list

    def index
        @articles = Article.order(id: :desc).limit(3)
        @insta_photos ||= InstagramService.new.insta_photos
    end
end
