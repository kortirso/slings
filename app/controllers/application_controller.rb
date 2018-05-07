class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, except: %i[new create destroy]
  prepend_view_path Rails.root.join('frontend')

  include ProductsCart

  before_action :set_products_cart, unless: :format_json?

  rescue_from ActionController::RoutingError, with: :render_not_found
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  private def categories_list
    @categories = Category.category_order
  end

  private def render_not_found
    render template: 'shared/404', status: 404
  end

  private def select_page
    params[:page].nil? ? 1 : params[:page]
  end

  private def format_json?
    request.format.json?
  end

  private def check_captcha
    response = CheckCaptchaService.new.check(result: params['g-recaptcha-response'])
    redirect_to feedback_path unless response['success']
  end
end
