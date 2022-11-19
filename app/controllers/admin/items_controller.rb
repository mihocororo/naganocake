class Admin::ItemsController < ApplicationController
  def index
  end

  def new
     @item = Item.new

  end

  def create
    @item = Item.new(iten_params)
    if @item.save
      resirect_to admin_items_path
    else
      redirect_to new_admin_item_path
    end
  end

  def show
  end

  def edit
  end

  def update
  end
end
