class WelcomeController < ApplicationController
    before_action :categories_list

    def index
        @articles = Article.order(id: :desc).limit(3)
        @insta_photos = Instagram.last.try(:insta_photos)
        @feedbacks = Feedback.lasts
    end
end
