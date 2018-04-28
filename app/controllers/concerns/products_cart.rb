module ProductsCart
  extend ActiveSupport::Concern

  private def set_products_cart
    @cart = session[:cart_id] ? Cart.find(session[:cart_id]) : Cart.create
    session[:cart_id] = @cart.id
  end
end
