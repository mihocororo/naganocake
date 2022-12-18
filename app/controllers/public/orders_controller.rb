class Public::OrdersController < ApplicationController
  def new
    @order = Order.new

  end

  def confirm
    @order = Order.new
    @total_price = calculate(current_customer)
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

  def calculate(customer)
    total_price = 0
    customer.cart_items.each do |cart_item|
      total_price += cart_item.amount*cart_item.item.price
  end
  return (total_price*1.1).round
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :name, :postal_code, :address, :postage,:payment_price,:pay_method,:order_status)
  end
end
