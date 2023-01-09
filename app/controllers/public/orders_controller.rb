class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @name = current_customer.last_name + current_customer.first_name
    @order = Order.new
    @addresses = current_customer.addresses
    
  end

  def confirm
    @order = Order.new(order_params)
    # (customer: current_customer, pay_method: params[:order][:pay_method])
    # @orders = Order.all


    # @orders = current_customer.orders

    if params[:order][:my_address] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = (current_customer.last_name)+(current_customer.first_name)


    elsif params[:order][:my_address] == "3"
      # ship = Address.find(params[:order][:address_id])
      @order.postal_code = ship.postal_code
      @order.address = ship.address
      @order.name = ship.name


    elsif params[:order][:my_address] == "2"
      @order.postal_code = params[:postal_code]
      @order.address = params[:address]
      @order.name = params[:name]
      @address = "1"
    end

      @cart_items = current_customer.cart_items

      # unless @order.valid? == true
        # @addresses = Address.where(customer: current_customer)
        # render :new
      # end

    @payment_price = 0

    # @cart_items.each do |cart_item|
    # @payment_price += cart_item
    # @order.payment_price = @payment_price+ cart_item.subtotal

    # end





  end




  def complete

  end

  def create
    @order = current_customer.orders.new(order_params)


    # if
      @order.save!
      redirect_to orders_complete_path
    # else
      # redirect_to orders_path
    # end


      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
      @order_item = OrderItem.new
      @order_item.item_id = cart_item.item_id
      @order_item.order_id = @order.id
      @order_item.amount = cart_item.amount
      @order_item.price = cart_item.item.price * cart_item.amount





      @order_item.save

      end




    @cart_items.destroy_all

  end

  def index
    @orders = current_customer.orders
    @orders = Order.page(params[:page])

    # @cart_items = current_customer.cart_items

    # @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    # @order_item = OrderItem.find(params[:id])
    @order_items = @order.order_items

    @cart_items = current_customer.cart_items


    @payment_price = 0
    # @order_items.each do |order_item|
    # @order.payment_price = @payment_price+ order_item.subtotal

    # @payment_price = @payment_price
    # end

  end

  # def calculate(customer)
  #   sum = 0
  #   customer.cart_items.each do |cart_item|
  #     sum += cart_item.amount*cart_item.item.price
  # end
  # return (payment_price*1.1).round
  # end

  private
  def order_params
    # params.
    params.require(:order).permit(:name, :postal_code, :address,:payment_price,:pay_method)
  end

  private
  def address_params
    params.require(:order).permit(:name, :postal_code, :address)
  end

  # params.require(:order).permit(:postal_code,:address,:name,:pay_method,)



end