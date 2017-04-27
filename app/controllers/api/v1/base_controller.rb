class Api::V1::BaseController < ApplicationController

    private

    def authenticate_token
        if params[:access_token] != ENV['API_ACCESS_TOKEN']
            render json: { error: 'Incorrect access token' }
        end
    end
end