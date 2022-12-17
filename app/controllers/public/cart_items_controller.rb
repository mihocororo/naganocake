class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @cart_items = current_customer.cart_items
    @items = Item.all
    # @cart_item = CartItem.new

    @total_price = @cart_items.sum{|cart_item|cart_item.item.price*cart_item.amount*1.1}
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])  # データ（レコード）を1件取得
    @cart_item.destroy  # データ（レコード）を削除
    redirect_to cart_items_path
  end

  def destroy_all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.item_id = params[:item_id]

    if @cart_item.save
      redirect_to "/cart_items/:id"
    else
      redirect_to "/admin"
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id,:amount)
  end
  # def items_params
  #   params.require(:item).permit(:image, :genre_id, :name, :introduction, :price, :is_active)
  # end
end
