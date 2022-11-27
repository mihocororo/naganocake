class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  # @item = Item.new

  end

  def new
     @item = Item.new
    # @item_image =
    # @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(items_params)
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
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
    redirect_to admin_items_path
    else
    render 'edit'
    end
  end

  private
  def items_params
    params.require(:item).permit(:image, :genre_id, :name, :introduction, :price, :is_active)
  end
end
