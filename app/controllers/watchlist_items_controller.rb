class WatchlistItemsController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @item = WatchlistItem.new()
    @item.movie = @movie
    @item.user = current_user
    if current_user.watchlist_items.where(movie: @movie).empty?
      @item.save
      redirect_to movie_path(@movie)
    else
      redirect_to movie_path(@movie)
    end
  end

  def destroy
    item = WatchlistItem.find(item_param)
    item.destroy
    redirect_to request.referrer
  end

  private

  def item_param
    params.require("id").to_i
  end
end
