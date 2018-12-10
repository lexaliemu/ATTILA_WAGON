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

  def index
    @users = User.all.where.not(id: current_user.id)
  end

  before_action :set_user, only: [:follow, :unfollow]

  def index
    @users = User.all.where.not(id: current_user.id)
  end

  def follow
    if current_user.follow(@user.id)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  def unfollow
    if current_user.unfollow(@user.id)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { render action: :follow }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
