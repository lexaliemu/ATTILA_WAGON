class FollowedPlaylistsController < ApplicationController
  def create
    @followed_playlist = FollowedPlaylist.new
    @followed_playlist.user = current_user
    @playlist = Playlist.find(playlist_param)
    @followed_playlist.playlist = @playlist
    @followed_playlist.save
    redirect_to playlist_path(@playlist)
  end

  def destroy
    @followed_playlist = FollowedPlaylist.find(params[:id])
    @playlist = @followed_playlist.playlist
    @followed_playlist.destroy
    redirect_to playlist_path(@playlist)
  end

  private

  def playlist_param
    params.require("@playlist").to_i
  end
end
