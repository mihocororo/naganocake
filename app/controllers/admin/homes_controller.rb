class Admin::HomesController < ApplicationController
  # before_action :authenticate_admin!
  def top
    @order = Order.page(params[:page])
    # @order_items = @order.order_items
    @orders = Order.all
  end
  private
  def orders_params
    params.require(:order).permit(:postal_code, :address, :name, :postage, :payment_price, :pay_method,:order_status)
  end
end


