class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @playlists = @user.created_playlists
  end

  def mywatchlist
    @watchlist = current_user.watchlist_items
  end

  def edit
  end

  def update
  end
end
