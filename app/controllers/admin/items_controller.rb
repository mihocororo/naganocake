class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  # @item = Item.new

  end

  def new
     @item = Item.new
    # @item = Item.find(params[:id])
  end

  def create
    @item = Item.new
    if @item.save
      redirect_to admin_items_path
    else
      redirect_to new_admin_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end
  
  private
  def items_params
    params.require(:item).permit(:image, :genre_id, :name, :introduction, :price, :is_active)
  end
end
