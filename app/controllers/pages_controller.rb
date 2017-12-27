class PagesController < ApplicationController
    def instructions; end

    def reviews
        respond_to do |format|
            format.html
            format.json do
                reviews = Feedback.published.lasts.page(select_page).per(4)
                render json: {
                    reviews: ActiveModel::Serializer::CollectionSerializer.new(reviews, each_serializer: FeedbackSerializer),
                    next_page: reviews.next_page
                }, status: 200
            end
        end
    end

    def feedback; end
end
