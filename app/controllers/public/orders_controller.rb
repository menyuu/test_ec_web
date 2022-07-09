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
    @order = current_customer.orders.new(order_params)
    cart_items = current_customer.cart_items.all
    if cart_items.size > 0
      @order.save
      cart_items.each do |cart_item|
        order_item = OrderItem.new
        order_item.item_id = cart_item.item_id
        order_item.order_id = @order.id
        order_item.amount = cart_item.amount
        order_item.price = cart_item.item.price
        order_item.save
      end
      cart_items.destroy_all
      redirect_to completion_path
    else
      redirect_to root_path
      flash[:notice] = "カートに商品がありません"
    end
  end

  private
  def order_params
    params.require(:order).permit(:name, :address, :code, :total_price, :payment_method)
  end
end
