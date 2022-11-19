class Admin::GenresController < ApplicationController
  def index
  @genres = Genre.all
  @genre = Genre.new
  end

  def create
    @genre = Genre.new
    if @genre.save
      redirect_to admin_genres_path
    else
      redirect_to
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to admin_genres_path
  end

     private
  def admin_params
    params.require(:admin).permit(:name)
  end
end
