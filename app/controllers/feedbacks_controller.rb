class FeedbacksController < ApplicationController
    def index
        render json: {
            feedbacks: ActiveModel::Serializer::CollectionSerializer.new(Feedback.lasts, each_serializer: FeedbackSerializer)
        }, status: 200
    end

    def create
        Feedback.create(feedback_params)
        redirect_to feedback_path
    end

    private

    def feedback_params
        params.require(:feedback).permit(:name, :body, :image)
    end
end