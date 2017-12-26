class FeedbacksController < ApplicationController
    def create
        Feedback.create(feedback_params)
        redirect_to feedback_path
    end

    private

    def feedback_params
        params.require(:feedback).permit(:name, :body, :image)
    end
end
