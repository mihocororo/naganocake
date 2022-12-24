class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
    @addresses = current_customer.address
  end

  def confirm
    @order = Order.new(
      pay_method: params[:order][:pay_method])
    # @payment_price = calculate(current_customer)
    @orders = Order.all

    if params[:order][:my_address] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = (current_customer.last_name)+(current_customer.first_name)


    elsif params[:order][:my_address] == "3"
      ship = Address.find(params[:order][:address_id])
      @order.postal_code = ship.postal_code
      @order.address = ship.address
      @order.name = ship.name

    elsif params[:order][:my_address] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      @address = "1"
    end
      # unless @order.valid? == true
      #   @addresses = Address.where(customer: current_customer)
      #   render :new
      # end


  end




  def complete

  end

  def create
    @order = current_customer.orders.new
    @order.save

     @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
      @order_item = OrderItem.new
      @order_item.item_id = cart_item.item_id
      @order_item.order_id = @order.id
      @order_item.amount = cart_item.amount
      @order_item.price = cart_item.item.price * cart_item.amount
      @order_item.name = cart_item.item.name
      @order_item.save

    sum = 0
    cart_items.each do |cart_item|
    sum += cart_item.amount*cart_item.item.price
    end
    session[:order][:payment_price] = sum + 800


    @cart_items.destroy_all


    redirect_to orders_complete_path
  end
  end

  def index
    @orders = current_customer.orders
    # @payment_price = calculate(current_customer)
    # @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @payment_price = calculate(current_customer)
    @order_items = @order.order_items
  end

  def calculate(customer)
    sum = 0
    customer.cart_items.each do |cart_item|
      sum += cart_item.amount*cart_item.item.price
  end
  # return (payment_price*1.1).round
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :name, :postal_code, :address, :postage,:payment_price,:pay_method,:order_status)
  end

  private
  def address_params
    params.require(:order).permit(:name, :postal_code, :address)
  end



end