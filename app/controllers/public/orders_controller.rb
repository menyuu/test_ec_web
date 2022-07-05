class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
  end

  def show
  end

  def confirmation
    @order = Order.new(order_params)
    if @order.payment_method == nil || params[:order][:select_address] == nil
      redirect_to cart_items_path
    end
    case params[:order][:select_address]
    when "1" then
      @order.name = current_customer.name
      @order.address = current_customer.address
      @order.code = current_customer.code
      @order.customer_id = current_customer.id
    when "2" then
      address = Address.find(params[:order][:registered_address])
      @order.name = address.name
      @order.address = address.address
      @order.code = address.code
      @order.customer_id = address.customer_id
    when "3" then
      @order.customer_id = current_customer.id
    end
    @cart_items = current_customer.cart_items.all
    @total_price = @cart_items.inject(0){|total, cart_item| total + cart_item.subtotal}
  end

  def completion
  end

  def create
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :code, :address, :name)
  end
  def order_confirmation_params
    params.require(:order).permit(:)
end
