class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.where(customer_id: current_customer)
    @total_price = @cart_items.inject(0){|total, cart_item| total + cart_item.subtotal}
  end

  def create
    # binding.pry
    # item = Item.find(params[:cart_item][:item_id])
    # puts cart_item_params[:item_id]
    # puts cart_item_params[:amount]
    cart_item = current_customer.cart_items.new(cart_item_params)
    if cart_item.save
      redirect_to cart_items_path
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def cancel
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
