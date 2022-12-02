class Public::HomesController < ApplicationController
  def top
    @items = Item.all
    @genres = Genre.all

  end

  def about
  end


private
  def homes_params
    params.require(:home).permit(:image, :genre_id)
  end
end