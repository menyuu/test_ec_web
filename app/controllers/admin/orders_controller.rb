class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])

  end

  def update
      @order = Order.find(params[:id])
      @order.update(order_status_params)
      if params[:order][:order_status] == "confirmation"
        @order.order_items.each do |order_item|
          order_item.update(production_status: "waiting_production")
        end
      end
      redirect_to request.referer
  end

  private

  def order_status_params
    params.require(:order).permit(:order_status)
  end
end
