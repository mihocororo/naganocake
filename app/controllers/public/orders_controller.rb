class Public::OrdersController < ApplicationController
  def new
    @order = Order.new

  end

  def confirm
    @order = Order.new
    # @cart_items = current_customer.order
    @orders = Order.all
  end

  def complete
    if @order.save
    redirect_to orders_complete_path
    else
    end
  end

  def create
  end

  def index
    @orders = Order.all
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :name, :postal_code, :address, :postage,:payment_price,:pay_method,:order_status)
  end
end
