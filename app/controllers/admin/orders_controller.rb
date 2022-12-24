class Admin::OrdersController < ApplicationController
  def show
    @orders = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
  end


  def order_params
    params.require(:order).permit(:customer_id, :name, :postal_code, :address, :postage,:payment_price,:pay_method,:order_status)
  end
end
