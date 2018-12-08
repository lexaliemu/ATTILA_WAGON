class WatchlistItemsController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @item = WatchlistItem.new()
    @item.movie = @movie
    @item.user = current_user
    @item.save
    redirect_to movie_path(@movie)
  end

  def destroy
  end
end
