class FollowedPlaylistsController < ApplicationController
  def create
    @followed_playlist = FollowedPlaylist.new
    @followed_playlist.user = current_user
    @playlist = Playlist.find(playlist_param)
    @followed_playlist.playlist = @playlist
    @followed_playlist.save

    activity = @followed_playlist.activities.last

    current_user.followers.each do |follower|
      ActionCable.server.broadcast("stories_#{follower.id}", {
        message_partial: ApplicationController.renderer.render(
          partial: "shared/story",
          locals: { activity: activity }
        )
      })
    end

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
