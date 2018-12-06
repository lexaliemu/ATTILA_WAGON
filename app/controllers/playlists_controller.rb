class PlaylistsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  def show
    @playlist = Playlist.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
