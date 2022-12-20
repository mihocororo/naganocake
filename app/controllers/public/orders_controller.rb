class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
    @addresses = current_customer.address
  end

  def confirm
    @order = Order.new(
      pay_method: params[:order][:pay_method])
    @total_price = calculate(current_customer)
    @orders = Order.all

    if params[:order][:my_address] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      # @order.name = last_name(current_customer)


    # elsif params[:order][:my_address] == "2"
    #   ship = Address.find(params[:order][:address_id])
    #   @order.postal_code = ship.postal_code
    #   @order.address = ship.address
    #   @order.name = ship.name

    elsif params[:order][:my_address] == "3"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      @address = "1"

      unless @order.valid? == true
        @addresses = Address.where(customer: current_customer)
        render :new
      end
    end




  end

  def complete

  end

  def create
    @order = current_customer.orders.new
    # @order.save

     @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
      @order_item = OrderDetail.new
      @order_item.item_id = cart_item.item_id
      @order_item.order_id = @order.id
      @order_item.count = cart_item.count
      @order_item.price = cart_item.item.price * cart_item.count
      @order_item.save
      end
    # 最後にカートを全て削除する
    @cart_items.destroy_all


    redirect_to orders_complete_path
  end

  def index
    # @orders = current_customer.orders
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])

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
