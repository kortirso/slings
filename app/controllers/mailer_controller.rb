class MailerController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :create

    def create
        AdminMailer.admin_email(mail_params).deliver_now if correct_mail_params?
        redirect_to feedback_path
    end

    private

    def mail_params
        params.permit(:author, :contact, :body)
    end

    def correct_mail_params?
        return false if mail_params[:body].empty?
        true
    end
end
