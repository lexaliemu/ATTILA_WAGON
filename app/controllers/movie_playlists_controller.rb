class MoviePlaylistsController < ApplicationController

  def create
    @movie = Movie.find(params[:movie_id])
    @playlist = Playlist.find(playlist_id_param)
    @movie_playlist = MoviePlaylist.new(movie: @movie, playlist: @playlist)
    @movie_playlist.save!
    redirect_to movie_path(@movie)
  end

  def destroy
  end

  private

  def playlist_id_param
    params.require("@playlist").to_i
  end
end
