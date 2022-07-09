class Admin::OrderItemsController < ApplicationController
  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(production_status_params)
    @order = Order.find(@order_item.order_id)
    if params[:order_item][:production_status] == "production"
      @order_item.order.update(order_status: "production")
    end
    if @order.order_items.all?{ |order_item| order_item.production_status == "production_completed" }
      @order_item.order.update(order_status: "preparation")
    end
    redirect_to request.referer
  end

  private

  def production_status_params
    params.require(:order_item).permit(:production_status)
  end
end
