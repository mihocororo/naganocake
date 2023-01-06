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
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to "/customers/my_page"
    else
      redirect_to "/admin"
    end
  end



  def unsubscribe
    @customer = current_customer
  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_deleted: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to '/'
  end

  private

  def customer_params
    params.require(:customer).permit(
      :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :phone_number)
  end



# before_action :configure_permitted_parameters, if: :devise_controller?

#   protected

#   def configure_permitted_parameters
#     devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
#   end


end
