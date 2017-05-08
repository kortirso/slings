class Api::V1::BaseController < ApplicationController
    skip_before_action :set_products_cart

    private

    def authenticate_token
        if params[:access_token] != ENV['API_ACCESS_TOKEN']
            render json: { error: 'Incorrect access token' }
        end
    end
end