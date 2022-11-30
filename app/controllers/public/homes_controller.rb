class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.all

  end

  def about
  end


private
  def homes_params
    params.require(:home).permit(:image, :genre_id)
  end
end