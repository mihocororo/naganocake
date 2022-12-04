class Public::CustomersController < ApplicationController
before_action :authenticate_customer!

  def show
    @customer = current_customer
    # @customer = Customer.find(params[:id])
  end

  def edit
    # @customer = Customer.find(params[:id])
    @customer = current_customer
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end
end
