class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.where(customer_id: current_customer)
    @total_price = @cart_items.inject(0){|total, cart_item| total + cart_item.subtotal}
  end

  def create
    # binding.pry
    # item = Item.find_by(id: cart_item_params[:item_id])
    # customer = CartItem.find_by(customer_id: current_customer, item_id: cart_item_params[:item_id])
    item = CartItem.find_by(customer_id: current_customer, item_id: cart_item_params[:item_id])
    if item
      cart_item = item.update(amount: item.amount + cart_item_params[:amount].to_i)
      redirect_to cart_items_path
    else
      cart_item = current_customer.cart_items.new(cart_item_params)
      if cart_item.save
        redirect_to cart_items_path
      end
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
