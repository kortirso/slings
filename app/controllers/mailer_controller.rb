class MailerController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[verification]
  before_action :check_captcha, only: %i[create]

  def create
    AdminMailer.admin_email(mail_params).deliver_now if correct_mail_params?
    redirect_to feedback_path
  end

  def verification
    # OrderVerificationService.new
    AdminMailer.yandex_money_email.deliver_now
    render json: {}, status: 200
  end

  private def mail_params
    params.permit(:author, :contact, :body)
  end

  private def correct_mail_params?
    return false if mail_params[:body].empty?
    true
  end
end
